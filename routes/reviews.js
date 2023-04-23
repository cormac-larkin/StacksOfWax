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
      req.flash("success", "Review added successfully!");
      res.redirect(`/collections?id=${collectionId}`);
    }
  );
});

router.post("/delete", ensureAuthenticated, (req, res) => {

  const {reviewId} = req.body;

  // Check that the request is coming from the author of the review
  db.query("SELECT user_id FROM review WHERE review_id = ?", [reviewId], (err, result) => {
    if (err) {
      console.error(err);
      return res.redirect("/error/500");
    } 
    const ownerId = result[0].user_id;

    // Return '403 Forbidden' response if the request is not coming from the review's author
    if (req.session.user.id != ownerId) {
      return res.status(403).send();
    }

    // Otherwise delete the review and redirect back to the User's account page
    db.query("DELETE FROM review WHERE review_id = ?", [reviewId], (err, result) => {
      if (err) {
        console.error(err);
        return res.redirect("/error/500");
      }
      req.flash("success", "Review deleted successfully!");
      res.redirect(`/users?id=${req.session.user.id}`);
    });
  });
});

module.exports = router;
