const express = require("express");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.get("/", ensureAuthenticated, (req, res) => {
    req.session.destroy();
    res.redirect("/login");
});

module.exports = router;