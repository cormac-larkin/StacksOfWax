const ensureNotAuthenticated = (req, res, next) => {
    if (!req.session.isAuth) {
      return next();
    }
    res.redirect("/home");
  };
  
  module.exports = ensureNotAuthenticated;