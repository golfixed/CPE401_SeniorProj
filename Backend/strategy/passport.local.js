const passport = require("passport"),
  LocalStrategy = require("passport-local").Strategy;

module.exports = () => {
  passport.serializeUser(function (user, done) {
    done(null, user.username);
  });

  passport.deserializeUser(function (user, done) {
    done(null, user);
  });

  passport.use(
    new LocalStrategy(function (username, password, done) {
      // user authen check
      if (username === "hello")
        return done(null, { username: "hello", createAt: new Date() });
      else return done(null, false, { message: "invalid user" });
    })
  );
};
