const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/browse", (req, res) => {

});

router.get("/create", ensureAuthenticated, (req, res) => {
    db.query(
        "SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, image_url, year FROM vinyl INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id GROUP BY vinyl.name",
        (err, result) => {
          if (err) throw err;
          res.render("create_collection", { user: req.session.user, vinyls: result });
        }
      );
});

router.post("/create", (req, res) => {
  
    const userId = req.session.user.id

    // Get the vinyl IDs
    let vinylIds = [];
    for (key in req.body) {
      if (key.startsWith("vinyl")) {
        vinylIds.push(req.body[key]);
      }
    }

    // Insert the new collection and get the collection ID
    db.query("INSERT INTO collection (name, user_id) VALUES (?, ?)", ["test", userId], (err, result) => {
      if (err) throw err;
      const collectionId = result.insertId;

      // Link all the Vinyls to the new collection (using collection_vinyl table)
      vinylIds.forEach((vinylId) => {
        db.query("INSERT INTO collection_vinyl (collection_id, vinyl_id) VALUES (?, ?)", [collectionId, vinylId], (err, result) => {
          if (err) throw err;
        });
      });
      res.redirect("/collections/browse")
    });

  
})

module.exports = router;
