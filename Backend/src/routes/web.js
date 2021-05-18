import express from "express";
import homePageController from "../controllers/homePageController";
import registerController from "../controllers/registerController";
import loginController from "../controllers/loginController";
import classController from "../controllers/classController";
import passport from "passport";
import initPassportLocal from "../controllers/passportLocalController";

import setting from "../services/setting/setting";
import classCode from "../services/class/classCode";
import editProfile from "../services/setting/editProfile";
import editAccount from "../services/setting/editAccount";
import classMember from "../services/class/classMember";
import delMember from "../services/class/delMember";
import joinClass from "../services/class/joinClass";
import createPost from "../services/class/post/createPost";
import createPoll from "../services/class/post/createPoll";
import addComment from "../services/class/post/addComment";
import delComment from "../services/class/post/delComment";
import getPost from "../services/class/post/getPost";
import delPost from "../services/class/post/delPost";
import createTopic from "../services/class/materials/createTopic";
import postMaterial from "../services/class/materials/postMaterial";
import getMaterials from "../services/class/materials/getMaterials";
import delMaterial from "../services/class/materials/deleteMaterial";

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
    //REGISTOR
    router.get("/register", registerController.getPageRegister);
    router.post("/register", registerController.createNewUser);
    router.post("/logout", reqJWT, loginController.postLogOut);

    //CLASS
    router.get("/:class_code", reqJWT, classCode);
    router.post("/class/createClass", reqJWT, classController.createNewClass);
    router.post("/joinClass", reqJWT, joinClass);

    //CLASS MEMBER
    router.get("/classMember/:class_code/:section", reqJWT, classMember);
    router.delete("/deleteMember/:id", reqJWT, delMember);

    //MATERIAL
    router.get("/materials/:id", reqJWT, getMaterials);
    router.post("/createTopic", reqJWT, createTopic);
    router.post("/postMaterial", reqJWT, postMaterial);
    router.delete("/deleteMaterial/:id", reqJWT, delMaterial);

    //POST
    router.post("/:class/createPost", reqJWT, createPost);
    router.post("/addComment/:post", reqJWT, addComment);
    router.delete("/deleteComment/:id", reqJWT, delComment);
    router.get("/post/:id", reqJWT, getPost);
    router.delete("/deletePost/:id", reqJWT, delPost);
    
    //POLL
    router.post("/createPoll", reqJWT, createPoll);
    

    //SETTING
    router.get("/setting/:id", reqJWT, setting);
    router.put("/setting/editProfile/:id", reqJWT, editProfile);
    router.put("/setting/editAccount/:id",reqJWT, editAccount);

    return app.use("/", router);
};
module.exports = initWebRoutes;
