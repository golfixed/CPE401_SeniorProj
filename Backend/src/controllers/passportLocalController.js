import passportLocal from "passport-local";
import passport from "passport";
import loginService from "../services/loginService";

let LocalStrategy = passportLocal.Strategy;
const passportJWT = require("passport-jwt"),
ExtractJWT    = passportJWT.ExtractJwt,
JWTStrategy   = passportJWT.Strategy

const user = require('../services/loginService');

let initPassportLocal = () => {
    passport.use(new LocalStrategy({
        usernameField: 'email',
        passwordField: 'password'
      }, 
      (email, password, cb) => {        

        //check email in DB
        if (email == loginService.handleLogin) 
          return cb(null, false, {message: 'Incorrect email or password.'})
                
        return cb(null, {message: 'Logged In Successfully'})
      }
    ));

        passport.use(new JWTStrategy({
            jwtFromRequest: ExtractJWT.fromAuthHeaderAsBearerToken(),
            secretOrKey   : 'your_jwt_secret'
        },
        (jwtPayload, cb) => {
    
          try {
            // find the user in DB
            if(jwtPayload.id == user.id) {
              return cb(null, user);
            } else {
              return cb(null, false);
            }
          } catch (error) {
            return cb(error, false);
          }
        }
    ));

};

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser((id, done) => {
    loginService.findUserById(id).then((user) => {
        return done(null, user);
    }).catch(error => {
        return done(error, null)
    });
});

module.exports = initPassportLocal;