import express from "express";
import homePageController from "../controllers/homePageController";
import registerController from "../controllers/registerController";
import loginController from "../controllers/loginController";
import auth from "../validation/authValidation";
import passport from "passport";
import initPassportLocal from "../controllers/passportLocalController";

// Init all passport
initPassportLocal();

let router = express.Router();
const jwt = require('jsonwebtoken')

let initWebRoutes = (app) => {
    router.get("/", loginController.checkLoggedIn, homePageController.handleHelloWorld);
    router.get("/login",loginController.checkLoggedOut, loginController.getPageLogin);
    //in case of Redirect to Homepage

    // router.post("/login", passport.authenticate("local", {
    //     successRedirect: "/",
    //     failureRedirect: "/login",
    //     successFlash: true,
    //     failureFlash: true
    // }));
    router.post('/login', (req, res, next) => {
  
        passport.authenticate('local', {session: false}, (err, user, info) => {
            if (err) return next(err)
            if(user) {
                const token = jwt.sign(user, 'your_jwt_secret')
                return res.json({user, token})
            } else {
                return res.status(422).json(info)
             }
        })(req, res, next);
    });

    router.get("/register", registerController.getPageRegister);
    router.post("/register", registerController.createNewUser);
    router.post("/logout", loginController.postLogOut);
    return app.use("/", router);
};
module.exports = initWebRoutes;
