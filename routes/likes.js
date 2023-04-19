const express = require("express");
const db = require("../database/connection");
const ensureAuthenticated = require("../middleware/ensureAuthenticated");

const router = express.Router();

router.post("/add", ensureAuthenticated, (req, res) => {
  const userId = req.session.user.id;
  const { collectionId } = req.body;

  // Insert the like and link it to the collection Id and the user Id (of the user who liked)
  db.query(
    "INSERT INTO likes (user_id, collection_id) VALUES (?, ?)",
    [userId, collectionId],
    (err, result) => {
      if (err) throw err;
      res.redirect(`/collections?id=${collectionId}`);
    }
  );
});

module.exports = router;
