const passport = require("passport"),
  LocalStrategy = require("passport-local").Strategy;

passport.use(
  new LocalStrategy(function (username, password, done) {
    if (username === "hello") return done(null, { username: "hello" });
    else return done(null, false, { message: "invalid user" });
  })
);
