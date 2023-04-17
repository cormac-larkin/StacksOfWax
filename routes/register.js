const express = require("express");
const bcrypt = require("bcrypt");
const db = require("../database/connection");
const ensureNotAuthenticated = require("../middleware/ensureNotAuthenticated");

const router = express.Router();

router.get("/", ensureNotAuthenticated, (req, res) => {
  res.render("register", { user: req.session.user });
});

router.post("/", async (req, res) => {
  // Parse the request body
  const { firstName, lastName, dateOfBirth, email, password } = req.body;

  // If the email has already been registered, redirect to /register with an error message
  db.query(
    "SELECT * FROM user WHERE email = ?",
    [email],
    async (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        req.flash("error", "That email address has already been registered!");
        return res.redirect("/register");
      }

      // Otherwise, Hash the supplied password
      const hashedPassword = await bcrypt.hash(password, 10);

      // Insert new User into database
      const query =
        "INSERT INTO user (first_name, last_name, date_of_birth, email, password, join_date, last_login) VALUES (?, ?, ?, ?, ?, ?, ?)";
      const queryValues = [
        firstName,
        lastName,
        dateOfBirth,
        email,
        hashedPassword,
        new Date(),
        new Date(),
      ];
      db.query(query, queryValues, (err, result) => {
        if (err) throw err;

        // Redirect to /login with success message
        req.flash(
          "success",
          "Account registered successfully! Log in to get started!"
        );
        return res.redirect("/login");
      });
    }
  );
});

module.exports = router;
