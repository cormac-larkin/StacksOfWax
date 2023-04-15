require("dotenv").config();

const express = require("express");
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const flash = require("express-flash");
const session = require("express-session");
const ensureAuthenticated = require("./middleware/ensureAuthenticated");
const ensureNotAuthenticated = require("./middleware/ensureNotAuthenticated");

// Configure Express
const app = express();
app.set("view engine", "ejs");
app.use(express.static("public/css"));
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

// Connect to database
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "stacks_of_wax",
  port: "3306",
});
db.connect((err) => {
  if (err) throw err;
  console.log("*** Database connected successfully ***");
});

app.get("/", ensureNotAuthenticated, (req, res) => {
  res.render("landing");
})

app.get("/home", (req, res) => {
  res.render("index", { user: req.session.user });
});

app.get("/login",  ensureNotAuthenticated, (req, res) => {
  res.render("login", { user: req.session.user });
});

app.post("/login", (req, res) => {
  
  // Parse the request body
  const {email, password} = req.body;

  // Search for User with this email in our DB
  db.query("SELECT * from user WHERE email = ?", [email], async (err, result) => {

  if (err) throw err;
   
  // If no user with that email is found, redirect to /login with error message
   if (result.length === 0) {
    req.flash("error", "Invalid username or password")
    return res.redirect("/login");
   }

  // Otherwise, compare the supplied password with the password hash in the DB
   const storedHash = result[0].password;
   const passwordMatch = await bcrypt.compare(password, storedHash);
   
  // If they match, user is authenticated. Attach User object to req.session and set 'isAuth' flag to true.
   if (passwordMatch) {
    db.query("UPDATE user SET last_login = ? WHERE email = ?", [new Date(), email], (err, result) => {
      if (err) throw err;
    });
    req.session.isAuth = true;
    req.session.user = {firstName: result[0].first_name, lastName: result[0].last_name, email: result[0].email}
    return res.redirect("/home"); // Redirect to '/home' with welcome message
   } else {
    req.flash("error", "Invalid username or password")
    return res.redirect("/login");
   }
  });
})

app.get("/register",  ensureNotAuthenticated, (req, res) => {
  res.render("register", { user: req.session.user });
})

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

app.get("/logout", ensureAuthenticated, (req, res) => {
  req.session.destroy();
  res.redirect("/login");
})

app.listen(3000, () => {
  console.log("*** Server listening on http://localhost:3000/ ***");
});
