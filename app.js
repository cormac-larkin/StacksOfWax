require("dotenv").config();

const express = require("express");
const db = require("./database/connection");
const bcrypt = require("bcrypt");
const flash = require("express-flash");
const session = require("express-session");
const ensureAuthenticated = require("./middleware/ensureAuthenticated");
const ensureNotAuthenticated = require("./middleware/ensureNotAuthenticated");

// Configure Express
const app = express();
app.set("view engine", "ejs");
app.use(express.static('public/css'));
app.use(express.static("public/images"));
app.use(express.static("public/scripts"));
app.use(express.urlencoded({ extended: false }));
app.use(
  session({
    cookie: { maxAge: 1000 * 60 * 60 * 24 },
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
  })
);
app.use(flash());

app.get("/", ensureNotAuthenticated, (req, res) => {
  res.render("landing");
});

app.get("/home", (req, res) => {
  res.render("index", { user: req.session.user });
});

app.get("/register",  ensureNotAuthenticated, (req, res) => {
  res.render("register", { user: req.session.user });
});

app.post("/register", async (req, res) => {

  // Parse the request body
  const {firstName, lastName, dateOfBirth, email, password} = req.body;

  // If the email has already been registered, redirect to /register with an error message
  db.query("SELECT * FROM user WHERE email = ?", [email], async (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      req.flash("error", "That email address has already been registered!");
      return res.redirect("/register")
    } 

    // Otherwise, Hash the supplied password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert new User into database
    const query = "INSERT INTO user (first_name, last_name, date_of_birth, email, password, join_date, last_login) VALUES (?, ?, ?, ?, ?, ?, ?)";
    const queryValues = [firstName, lastName, dateOfBirth, email, hashedPassword, new Date(), new Date()];
    db.query(query, queryValues, (err, result) => {
      if (err) throw err;

      // Redirect to /login with success message
      req.flash("success", "Account registered successfully! Log in to get started!")
      return res.redirect("/login");
    });
});
});

app.get("/vinyls", (req, res) => {

  db.query("SELECT vinyl.name, artist.name AS artist, image_url, year FROM vinyl LEFT JOIN artist ON vinyl.artist_id = artist.artist_id", (err, result) => {
    if (err) throw err;
    res.render("vinyls", { user: req.session.user, vinyls: result })
  });
});

app.get("/vinyls/add", (req, res) => {

  db.query("SELECT name FROM artist ORDER BY name ASC", (err, result) => {
    if (err) throw err;
    const artists = result;

    db.query("SELECT name FROM genre ORDER BY name ASC", (err, result) => {
      if (err) throw err;
      const genres = result;
      res.render("add_vinyl", { user: req.session.user, artists, genres });
    })
    
  })

  
});

app.post("/vinyls/add", (req, res) => {

  // Get values from req.body
  const {vinylName, genre, subGenre, artist, year, albumArt} = req.body;
  console.log(req.body);
  
  // Get the track names
  let trackNames = [];
  for (key in req.body) {
    if (key.startsWith("track")) {
      trackNames.push(req.body[key]);
    }
  }

  // Find Artist ID
  db.query("SELECT artist_id FROM artist WHERE name = (?)", [artist], (err, result) => {
    if (err) throw err;
    console.log(result);
    const artistId = result[0].artist_id;

    // Insert Vinyl and Link to Artist
    db.query("INSERT INTO vinyl (name, year, image_url, artist_id) VALUES (?, ?, ?, ?)", [vinylName, year, albumArt, artistId], (err, result) => {
      if (err) throw err;
      const vinylId = result.insertId;

      // Get the ID of the Primary Genre and link it to the Vinyl (using vinyl_genre table)
      db.query("SELECT genre_id from genre WHERE name = (?)", [genre], (err, result) => {
        if (err) throw err;
        const genreId = result[0].genre_id;

        db.query("INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)", [vinylId, genreId], (err, result) => {
          if (err) throw err;
          
          // Get the ID of the Subgenre and link it to the Vinyl (using vinyl_genre table)
          db.query("SELECT genre_id from genre WHERE name = (?)", [subGenre], (err, result) => {
            if (err) throw err;
            const subGenreId = result[0].genre_id;

            db.query("INSERT INTO vinyl_genre (vinyl_id, genre_id) VALUES (?, ?)", [vinylId, subGenreId], (err, result) => {
              if (err) throw err;

              // Insert all the tracks and link to Vinyl
              trackNames.forEach((track) => {
                db.query("INSERT INTO track (name, vinyl_id) VALUES (?, ?)", [track, vinylId], (err, result) => {
                    if (err) throw err;
                });
              });
              res.redirect("/vinyls");
            });
          });
        });
      });
    });
  });  
});

app.get("/logout", ensureAuthenticated, (req, res) => {
  req.session.destroy();
  res.redirect("/login");
});

app.listen(3000, () => {
  console.log("*** Server listening on http://localhost:3000/ ***");
});
