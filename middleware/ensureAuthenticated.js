const ensureAuthenticated = (req, res, next) => {
  if (req.session.isAuth) {
    return next();
  }
  res.redirect("/login");
};

module.exports = ensureAuthenticated;
