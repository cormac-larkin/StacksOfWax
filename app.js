require("dotenv").config();
const express = require("express");
const flash = require("express-flash");
const session = require("express-session");
const ensureNotAuthenticated = require("./middleware/ensureNotAuthenticated");

const loginRoutes = require("./routes/login");
const registerRoutes = require("./routes/register");
const vinylRoutes = require("./routes/vinyls");
const homeRoutes = require("./routes/home");
const logoutRoutes = require("./routes/logout");
const collectionRoutes = require("./routes/collections");
const reviewRoutes = require("./routes/reviews");
const likeRoutes = require("./routes/likes");
const userRoutes = require("./routes/users");
const errorRoutes = require("./routes/errors");

// Configure Express
const app = express();
app.use(flash());
app.set("view engine", "ejs");
app.use(express.static('public/css'));
app.use(express.static("public/images"));
app.use(express.static("public/scripts"));
app.use(express.urlencoded({ extended: false }));

// Configure Sessions/Cookies
app.use(
  session({
    cookie: { maxAge: 1000 * 60 * 60 * 24 },
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
  })
);

app.use("/home", homeRoutes);
app.use("/register", registerRoutes);
app.use("/login", loginRoutes);
app.use("/logout", logoutRoutes);
app.use("/vinyls", vinylRoutes);
app.use("/collections", collectionRoutes);
app.use("/reviews", reviewRoutes);
app.use("/likes", likeRoutes);
app.use("/users", userRoutes);
app.use("/error", errorRoutes);

app.get("/", ensureNotAuthenticated, (req, res) => {
  res.render("landing");
});

app.listen(3000, () => {
  console.log("*** Server listening on http://localhost:3000/ ***");
});
