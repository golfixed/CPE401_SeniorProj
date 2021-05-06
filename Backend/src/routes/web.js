import express from "express";
import homePageController from "../controllers/homePageController";
import registerController from "../controllers/registerController";
import loginController from "../controllers/loginController";
import classController from "../controllers/classController";
import passport from "passport";
import initPassportLocal from "../controllers/passportLocalController";

import setting from "../services/setting";
import classCode from "../services/class/classCode";
import editProfile from "../services/editProfile";
import editAccount from "../services/editAccount";
import classMember from "../services/class/classMember";

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
                const genToken = user => {
                    return jwt.sign({
                      iss: 'Classi jwt',
                      sub: user.id,
                      iat: new Date().getTime()
                    }, 'your_jwt_secret');
                  }
                const token = genToken(user);
                return res.json({user, token})
            } else {
                return res.status(422).json(info)
            }
        })(req, res, next);
    });

    const reqJWT = passport.authenticate('jwt', {session: false});

    router.get("/register", registerController.getPageRegister);
    router.post("/register", registerController.createNewUser);
    router.post("/logout", reqJWT, loginController.postLogOut);

    // router.post("/class/createClass", createClass);
    router.post("/class/createClass", reqJWT, classController.createNewClass);
    router.get("/:class_code", reqJWT, classCode);

    router.get("/:class_code/classMember", reqJWT, classMember);

    router.get("/setting/:id", reqJWT, setting);
    router.put("/setting/:id/editProfile", reqJWT, editProfile);
    router.put("/setting/:id/editAccount",reqJWT, editAccount);

    return app.use("/", router);
};
module.exports = initWebRoutes;
