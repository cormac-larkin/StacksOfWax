const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/browse", (req, res) => {
  db.query(
    "SELECT collection.collection_id, collection.name AS collection_name, first_name, last_name FROM collection INNER JOIN user ON collection.user_id = user.user_id GROUP BY collection.collection_id",
    (err, result) => {
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

  // Get the vinyl IDs
  let vinylIds = [];
  for (key in req.body) {
    if (key.startsWith("vinyl")) {
      vinylIds.push(req.body[key]);
    }
  }

  // Insert the new collection and get the collection ID
  db.query(
    "INSERT INTO collection (name, user_id) VALUES (?, ?)",
    ["test", userId],
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
    "SELECT collection_id, name, user.user_id, user.first_name, user.last_name, timestamp, image_url AS user_pic FROM collection INNER JOIN user ON collection.user_id = user.user_id WHERE collection_id = ?",
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
          res.render("inspect_collection", { user: req.session.user, collection, vinyls });
        }
      );
    }
  );
});

module.exports = router;
