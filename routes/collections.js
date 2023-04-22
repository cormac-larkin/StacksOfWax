const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/browse", (req, res) => {

  const queryParams = req.query;

  // The default SQL query if no query params were given in the URL
  let sqlQuery = "SELECT collection.collection_id, collection.name AS collection_name, COUNT(DISTINCT likes.like_id) AS likes, COUNT(DISTINCT review.review_id) AS reviews, ROUND(AVG(review.rating), 1) AS rating, first_name, last_name FROM collection LEFT JOIN user ON collection.user_id = user.user_id LEFT JOIN review ON review.collection_id = collection.collection_id LEFT JOIN likes ON collection.collection_id = likes.collection_id GROUP BY collection.collection_id";
  
  // If the URL contains query params for sorting the collections, use them to construct a new query
  if (Object.keys(queryParams).length > 0) {
    sqlQuery = `SELECT collection.collection_id, collection.name AS collection_name, COUNT(DISTINCT likes.like_id) AS likes, COUNT(DISTINCT review.review_id) AS reviews, ROUND(AVG(review.rating), 1) AS rating, first_name, last_name FROM collection LEFT JOIN user ON collection.user_id = user.user_id LEFT JOIN review ON review.collection_id = collection.collection_id LEFT JOIN likes ON collection.collection_id = likes.collection_id GROUP BY collection.collection_id ORDER BY ${queryParams.field} ${queryParams.order}`;
  }

  db.query(
    sqlQuery,
    (err, result) => {
      if (err) throw err;
      const collections = result;
      res.render("browse_collections", { user: req.session.user, collections });
    }
  );
});

router.get("/create", ensureAuthenticated, (req, res) => {
  db.query(
    "SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, image_url, year FROM vinyl INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id GROUP BY vinyl.name",
    (err, result) => {
      if (err) throw err;
      res.render("create_collection", {
        user: req.session.user,
        vinyls: result,
      });
    }
  );
});

router.post("/create", ensureAuthenticated, (req, res) => {
  const userId = req.session.user.id;
  const collectionName = req.body.collectionName;

  // Get the vinyl IDs
  let vinylIds = [];
  for (key in req.body) {
    if (key.startsWith("vinyl")) {
      vinylIds.push(req.body[key]);
    }
  }

  // Insert the new collection and get the collection ID
  db.query(
    "INSERT INTO collection (name, timestamp, user_id) VALUES (?, ?, ?)",
    [collectionName, new Date(), userId],
    (err, result) => {
      if (err) throw err;
      const collectionId = result.insertId;

      // Link all the Vinyls to the new collection (using collection_vinyl table)
      vinylIds.forEach((vinylId) => {
        db.query(
          "INSERT INTO collection_vinyl (collection_id, vinyl_id) VALUES (?, ?)",
          [collectionId, vinylId],
          (err, result) => {
            if (err) throw err;
          }
        );
      });
      res.redirect("/collections/browse");
    }
  );
});

router.get("/", (req, res) => {
  const collectionId = req.query.id;

  // Get the collection info
  db.query(
    "SELECT collection_id, name, user.user_id, user.first_name, user.last_name, collection.timestamp, image_url AS user_pic FROM collection INNER JOIN user ON collection.user_id = user.user_id WHERE collection_id = ?",
    [collectionId],
    (err, result) => {
      if (err) throw err;

      // Return a 404 if no collection is found for that ID
      if (result.length === 0) {
        return res.status(404).send();
      }

      const collection = result[0];

      // Retrieve data for vinyls in this collection
      db.query(
        "SELECT vinyl.vinyl_id, vinyl.name AS vinyl_name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, year, image_url FROM vinyl INNER JOIN collection_vinyl ON vinyl.vinyl_id = collection_vinyl.vinyl_id INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON vinyl_genre.genre_id = genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id WHERE collection_id = ? GROUP BY vinyl.name;",
        [collectionId],
        (err, result) => {
          if (err) throw err;
          const vinyls = result;

          // Retrieve reviews for this collection
          db.query("SELECT user.user_id, first_name, last_name, title, rating, review.text, review.timestamp FROM review INNER JOIN user ON user.user_id = review.user_id WHERE collection_id = ?", [collectionId], (err, result) => {
            if (err) throw err;
            const reviews = result;

            let alreadyReviewed = false;
            reviews.forEach((review) => {
              if (req.session.user && review.user_id == req.session.user.id) {
                alreadyReviewed = true;
              } 
            });
            
            // Retrieve the likes for this collection
            db.query("SELECT * FROM likes WHERE collection_id = ?", [collectionId], (err, result) => {
              if (err) throw err;
              const likes = result;

              // Check if the User viewing the page has already liked the collection (If yes, the 'Like' button will be disabled in template)
              let alreadyLiked = false;
              likes.forEach((like) => {
                if (req.session.user && like.user_id == req.session.user.id) {
                  alreadyLiked = true;
                }
              });

              res.render("inspect_collection", { user: req.session.user, collection, vinyls, alreadyLiked, alreadyReviewed, likes, reviews });
            })
          })
        }
      );
    }
  );
});

router.post("/delete", ensureAuthenticated, (req, res) => {

  const {collectionId} = req.body;

  // Check that the request is coming from the owner of the collection
  db.query("SELECT user_id FROM collection WHERE collection_id = ?", [collectionId], (err, result) => {
    if (err) throw err;
    const ownerId = result[0].user_id;

    // Return 403 Forbidden response if the request is not coming from the collection's owner
    if (req.session.user.id != ownerId) {
      return res.status(403).send();
    }

    // Otherwise delete the collection and redirect back to the User's account page
    db.query("DELETE FROM collection WHERE collection_id = ?", [collectionId], (err, result) => {
      if(err) throw err;
      res.redirect(`/users?id=${req.session.user.id}`);
    });

  });


});

module.exports = router;
