const express = require("express");
const router = express.Router();

router.get("/404", (req, res) => {
    return res.status(404).render("404", {user: req.session.user})
});

router.get("/500", (req, res) => {
    return res.status(500).render("500", {user: req.session.user})
});

module.exports = router;