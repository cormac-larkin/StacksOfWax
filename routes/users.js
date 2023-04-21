const express = require("express");
const db = require("../database/connection");

const router = express.Router();

router.get("/", (req, res) => {
  let profileOwner = false;
  const userId = req.query.id;

  // Check if the user is viewing their own profile
  if (req.session.user && req.session.user.id == userId) {
    profileOwner = true;
  }

  const sqlQuery = `\
SELECT user_id, first_name, last_name, date_of_birth, join_date, last_login, image_url FROM user WHERE user_id = ?;\
SELECT review.review_id, review.collection_id, title, review.text, rating, review.timestamp, collection.name FROM review INNER JOIN collection ON review.collection_id WHERE review.user_id = ? GROUP BY review.review_id;\
SELECT * FROM likes WHERE user_id = ?;\
SELECT collection.collection_id, collection.name AS collection_name, COUNT(DISTINCT likes.like_id) AS likes, COUNT(DISTINCT review.review_id) AS reviews, ROUND(AVG(review.rating), 1) AS rating FROM collection LEFT JOIN user ON collection.user_id = user.user_id LEFT JOIN review ON review.collection_id = collection.collection_id LEFT JOIN likes ON collection.collection_id = likes.collection_id WHERE collection.user_id = ? GROUP BY collection.collection_id;\
`;

  db.query(sqlQuery, [userId, userId, userId, userId], (err, result) => {
    if (err) throw err;
    
    // Return 404 if no user found
    if (result[0].length === 0) {
        return res.status(404).send();
    }

    const userData = result[0][0];
    const reviews = result[1];
    const likes = result[2];
    const collections = result[3];

    res.render("inspect_profile", { user: req.session.user, profileOwner, userData, reviews, likes, collections });
  });
});

module.exports = router;
