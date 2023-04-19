const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.post("/add", ensureAuthenticated, (req, res) => {
  const reviewerId = req.session.user.id;
  const { collectionId, title, rating, reviewContent } = req.body;

  // Insert review and link it to the the reviewers User ID
  db.query(
    "INSERT INTO review (title, text, rating, timestamp, collection_id, user_id) VALUES (?, ?, ?, ?, ?, ?)",
    [title, reviewContent, rating, new Date(), collectionId, reviewerId],
    (err, result) => {
      if (err) throw err;
      res.redirect(`/collections?id=${collectionId}`);
    }
  );
});

module.exports = router;
