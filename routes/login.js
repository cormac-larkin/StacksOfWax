const express = require("express");
const router  = express.Router();
const ensureNotAuthenticated = require("../middleware/ensureNotAuthenticated");

router.get("/login",  ensureNotAuthenticated, (req, res) => {
    res.render("login", { user: req.session.user });
});
  
router.post("/login", (req, res) => {
    
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
});