const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/browse", (req, res) => {

  const queryParams = req.query;
  let sqlValues = [];


  // The default SQL query if no filter was provided in the query params
  let sqlQuery = 
  `SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, 
  artist.name AS artist, image_url, year FROM vinyl 
  INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id 
  INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id 
  INNER JOIN artist ON vinyl.artist_id = artist.artist_id 
  GROUP BY vinyl.name`

  // If query params were given, use them to construct a new filtered query
  if (Object.keys(queryParams).length > 0) {
    sqlValues.push(queryParams.field.concat(".name"));
    sqlValues.push(queryParams.name);
    sqlQuery = 
    `SELECT vinyl.vinyl_id, vinyl.name, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, 
    artist.name AS artist, image_url, year FROM vinyl 
    INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id 
    INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id 
    INNER JOIN artist ON vinyl.artist_id = artist.artist_id WHERE ?? = ? 
    GROUP BY vinyl.name`
  }

    // Get all vinyl info
    db.query(sqlQuery, sqlValues, (err, result) => {
      if (err) {
        console.error(err);
        return res.redirect("/error/500");
      } 
      const vinyls = result;
  
      // Get all genres for 'filter by genre' dropdown menu
      db.query("SELECT * FROM genre ORDER BY name ASC", (err, result) => {
        if (err) {
          console.error(err);
          return res.redirect("/error/500");
        }
        const genres = result;

        // Get all artists for 'filter by artist' menu
        db.query("SELECT * FROM artist ORDER BY name ASC", (err, result) => {
          if (err) {
            console.error(err);
            return res.redirect("/error/500");
          } 
          const artists = result;
  
          res.render("vinyls", { user: req.session.user, vinyls, artists, genres, filterName: queryParams.name || "All"});
        });
      });
    });
});

router.get("/add", ensureAuthenticated, (req, res) => {
  db.query("SELECT name FROM artist ORDER BY name ASC", (err, result) => {
    if (err) {
      console.error(err);
      return res.redirect("/error/500");
    }
    const artists = result;

    db.query("SELECT name FROM genre ORDER BY name ASC", (err, result) => {
      if (err) {
        console.error(err);
        return res.redirect("/error/500");
      }
      const genres = result;
      res.render("add_vinyl", { user: req.session.user, artists, genres });
    });
  });
});

router.post("/add", ensureAuthenticated, (req, res) => {
  
  const { vinylName, genre, subGenre, artist, year, albumArt } = req.body;

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
      if (err) {
        console.error(err);
        return res.redirect("/error/500");
      }
      const artistId = result[0].artist_id;

      // Insert Vinyl and Link to Artist
      db.query(
        "INSERT INTO vinyl (name, year, image_url, artist_id) VALUES (?, ?, ?, ?)",
        [vinylName, year, albumArt, artistId],
        (err, result) => {
          if (err) {
            console.error(err);
            return res.redirect("/error/500");
          }
          const vinylId = result.insertId;

          // Get the ID of the Primary Genre and link it to the Vinyl (using vinyl_genre table)
          db.query(
            "SELECT genre_id from genre WHERE name = (?)",
            [genre],
            (err, result) => {
              if (err) {
                console.error(err);
                return res.redirect("/error/500");
              }
              const genreId = result[0].genre_id;

              db.query(
                "INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)",
                [vinylId, genreId],
                (err, result) => {
                  if (err) {
                    console.error(err);
                    return res.redirect("/error/500");
                  }

                  // Get the ID of the Subgenre and link it to the Vinyl (using vinyl_genre table)
                  db.query(
                    "SELECT genre_id from genre WHERE name = (?)",
                    [subGenre],
                    (err, result) => {
                      if (err) {
                        console.error(err);
                        return res.redirect("/error/500");
                      }
                      const subGenreId = result[0].genre_id;

                      db.query(
                        "INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)",
                        [vinylId, subGenreId],
                        (err, result) => {
                          if (err) {
                            console.error(err);
                            return res.redirect("/error/500");
                          }

                          // Insert all the tracks and link to Vinyl
                          trackNames.forEach((track) => {
                            db.query(
                              "INSERT INTO track (name, vinyl_id) VALUES (?, ?)",
                              [track, vinylId],
                              (err, result) => {
                                if (err) {
                                  console.error(err);
                                  return res.redirect("/error/500");
                                }
                              }
                            );
                          });
                          req.flash("success", "Vinyl added successfully!");
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

router.get("/", (req, res) => {

  const vinylId = req.query.id;
  const sqlQuery = 
  `SELECT track.name, \`year\`, image_url, GROUP_CONCAT(genre.name SEPARATOR '/') AS genre, 
  artist.name AS artist, artist.artist_id, vinyl.name AS vinyl FROM vinyl 
  INNER JOIN vinyl_genre ON vinyl_genre.vinyl_id = vinyl.vinyl_id 
  INNER JOIN genre ON genre.genre_id = vinyl_genre.genre_id 
  INNER JOIN artist ON artist.artist_id = vinyl.artist_id 
  INNER JOIN track ON vinyl.vinyl_id = track.vinyl_id WHERE vinyl.vinyl_id = ? 
  GROUP BY track.name`;

  db.query(sqlQuery, [vinylId], (err, result) => {

    if (err) throw err;

    // Return a 404 error if no vinyl is found
    if (result.length === 0) {
      return res.redirect("/error/404");
    }
    
    const tracks = result;
    res.render("inspect_vinyl", { user: req.session.user, tracks } );
  });
});

module.exports = router;
