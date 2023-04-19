const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/genre", (req, res) => {
  // Get genre name from query string and insert into query
  const filterName = req.query.name;
  const query = "SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, image_url, year FROM vinyl INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id WHERE genre.name = ? GROUP BY vinyl.name";

  // Get all vinyl info
  db.query(query, [filterName], (err, result) => {
    if (err) throw err;
    const vinyls = result;

    // Get all genres for 'filter by genre' dropdown menu
    db.query("SELECT * FROM genre", (err, result) => {
      if (err) throw err;
      const genres = result;

      // Get all artists for 'filter by artist' menu
      db.query("SELECT * FROM artist", (err, result) => {
        if (err) throw err;
        const artists = result;

        res.render("vinyls", { user: req.session.user, vinyls, artists, genres, filterName });
      });
    });
  });
});

router.get("/artist", (req, res) => {
  // Get genre name from query string and insert into query
  const filterName = req.query.name;
  const query = "SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, image_url, year FROM vinyl INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id WHERE artist.name = ? GROUP BY vinyl.name";

  // Get all vinyl info
  db.query(query, [filterName], (err, result) => {
    if (err) throw err;
    const vinyls = result;

    // Get all genres for 'filter by genre' dropdown menu
    db.query("SELECT * FROM genre", (err, result) => {
      if (err) throw err;
      const genres = result;

      // Get all artists for 'filter by artist' menu
      db.query("SELECT * FROM artist", (err, result) => {
        if (err) throw err;
        const artists = result;

        res.render("vinyls", { user: req.session.user, vinyls, artists, genres, filterName });
      });
    });
  });
});

router.get("/browse", (req, res) => {

  const query = "SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, artist.name AS artist, image_url, year FROM vinyl INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id INNER JOIN artist ON vinyl.artist_id = artist.artist_id GROUP BY vinyl.name"

    // Get all vinyl info
    db.query(query, (err, result) => {
      if (err) throw err;
      const vinyls = result;
  
      // Get all genres for 'filter by genre' dropdown menu
      db.query("SELECT * FROM genre", (err, result) => {
        if (err) throw err;
        const genres = result;

        // Get all artists for 'filter by artist' menu
        db.query("SELECT * FROM artist", (err, result) => {
          if (err) throw err;
          const artists = result;
  
          res.render("vinyls", { user: req.session.user, vinyls, artists, genres, filterName: ""});
        });
      });
    });
});

router.get("/add", ensureAuthenticated, (req, res) => {
  db.query("SELECT name FROM artist ORDER BY name ASC", (err, result) => {
    if (err) throw err;
    const artists = result;

    db.query("SELECT name FROM genre ORDER BY name ASC", (err, result) => {
      if (err) throw err;
      const genres = result;
      res.render("add_vinyl", { user: req.session.user, artists, genres });
    });
  });
});

router.post("/add", ensureAuthenticated, (req, res) => {
  // Get vinyl info from req.body
  const { vinylName, genre, subGenre, artist, year, albumArt } = req.body;
  console.log(req.body);

  // Get the track names
  let trackNames = [];
  for (key in req.body) {
    if (key.startsWith("track")) {
      trackNames.push(req.body[key]);
    }
  }

  // Find Artist ID
  db.query(
    "SELECT artist_id FROM artist WHERE name = (?)",
    [artist],
    (err, result) => {
      if (err) throw err;
      console.log(result);
      const artistId = result[0].artist_id;

      // Insert Vinyl and Link to Artist
      db.query(
        "INSERT INTO vinyl (name, year, image_url, artist_id) VALUES (?, ?, ?, ?)",
        [vinylName, year, albumArt, artistId],
        (err, result) => {
          if (err) throw err;
          const vinylId = result.insertId;

          // Get the ID of the Primary Genre and link it to the Vinyl (using vinyl_genre table)
          db.query(
            "SELECT genre_id from genre WHERE name = (?)",
            [genre],
            (err, result) => {
              if (err) throw err;
              const genreId = result[0].genre_id;

              db.query(
                "INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)",
                [vinylId, genreId],
                (err, result) => {
                  if (err) throw err;

                  // Get the ID of the Subgenre and link it to the Vinyl (using vinyl_genre table)
                  db.query(
                    "SELECT genre_id from genre WHERE name = (?)",
                    [subGenre],
                    (err, result) => {
                      if (err) throw err;
                      const subGenreId = result[0].genre_id;

                      db.query(
                        "INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)",
                        [vinylId, subGenreId],
                        (err, result) => {
                          if (err) throw err;

                          // Insert all the tracks and link to Vinyl
                          trackNames.forEach((track) => {
                            db.query(
                              "INSERT INTO track (name, vinyl_id) VALUES (?, ?)",
                              [track, vinylId],
                              (err, result) => {
                                if (err) throw err;
                              }
                            );
                          });
                          res.redirect("/vinyls/browse");
                        }
                      );
                    }
                  );
                }
              );
            }
          );
        }
      );
    }
  );
});

module.exports = router;
