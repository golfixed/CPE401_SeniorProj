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
      async (email, password, done) => {
        try {
            await loginService.findUserByEmail(email).then(async (user) => {
                if (!user) {
                    return done(null, false, {false: true, message: 'Incorrect email'})
                }
                if (user) {
                    let match = await loginService.comparePassword(password, user);
                    if (match === true) {
                        return done(null, user, null)
                    } else {
                        return done(null, false, {false: true,message: 'Incorrect password.'}
                        )
                    }
                }
            });
        } catch (err) {
            console.log(err);
            return done(null, false, { message: err });
        }
    }));

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