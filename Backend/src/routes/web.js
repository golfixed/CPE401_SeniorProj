import express from "express";
import homePageController from "../controllers/homePageController";
import registerController from "../controllers/registerController";
import loginController from "../controllers/loginController";
import classController from "../controllers/classController";
import passport from "passport";
import initPassportLocal from "../controllers/passportLocalController";

import profile from "../services/setting/profile";
import addRole from "../services/setting/addRole";
import getProfileInfo from "../services/setting/getProfileInfo";
import editProfile from "../services/setting/editProfile";
import editAccount from "../services/setting/editAccount";

import classList from "../services/class/classList";
import classListAnnounce from "../services/class/classList-announce";
import addFavClass from "../services/class/addFavClass";
import discussion from "../services/class/discussion";
import classroom from "../services/class/classroom";
import getclassid from "../services/class/getclassid";
import getJoinCode from "../services/class/getJoinCode";
import getclassinfo from "../services/class/getclassinfo";
import joinClass from "../services/class/joinClass";

import classMember from "../services/class/classMember";
import delMember from "../services/class/delMember";

import createPost from "../services/class/post/createPost";
import announce from "../services/class/post/announce";
import posttab from "../services/class/post/posttab";
import addComment from "../services/class/post/addComment";
import delComment from "../services/class/post/delComment";
import getPost from "../services/class/post/getPost";
import delPost from "../services/class/post/delPost";

import createPoll from "../services/class/poll/createPoll";
import getPoll from "../services/class/poll/getPoll";
import clickVotes from "../services/class/poll/vote";
import getpollist from "../services/class/poll/polltab";
import delpoll from "../services/class/poll/delpoll";


import createTopic from "../services/class/materials/createTopic";
import postMaterial from "../services/class/materials/postMaterial";
import getMaterials from "../services/class/materials/getMaterials";
import delMaterialTopic from "../services/class/materials/deleteMaterialTopic";

// Init all passport
initPassportLocal();

let router = express.Router();
const jwt = require('jsonwebtoken')

let initWebRoutes = (app) => {
    router.get("/", loginController.checkLoggedIn, homePageController.handleHelloWorld);
    router.get("/login",loginController.checkLoggedOut, loginController.getPageLogin);
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
    router.post("/addrole", addRole);
    router.post("/getprofileinfo", getProfileInfo);
    router.post("/logout", loginController.postLogOut);

    //CLASS
    router.post("/classrooms", classList);
    router.post("/classrooms/announce", classListAnnounce);
    router.get("/classrooms/:id", classroom);
    router.post("/getclassinfo", getclassinfo);
    router.post("/getclassid", getclassid);
    router.post("/pinclass", addFavClass);
    router.get("/classrooms/:id/discussion", discussion);
    router.post("/createClass", classController.createNewClass);
    router.post("/joinclass", joinClass);

    //PIN CLASS
    router.get("/pinCode/:id", getJoinCode);

    //CLASS MEMBER
    router.post("/classmember", classMember);
    router.delete("/deletemember", delMember);

    //MATERIAL
    router.get("/materials/:class_id", getMaterials);
    router.post("/creatematerialtopic", createTopic);
    router.post("/postMaterial", postMaterial);
    router.delete("/deletematerialtopic", delMaterialTopic);
    
    //POST
    router.get("/getpostlist/:class_id", posttab);
    router.post("/createpost", createPost);
    router.get("/post/:id", getPost);
    router.delete("/deletepost", delPost);
    //COMMENT
    router.post("/addcomment", addComment);
    router.delete("/deletecomment", delComment);
    router.post("/announce", announce);
    
    //POLL
    router.get("/getpolllist/:class_id", getpollist);
    router.post("/createpoll", createPoll);
    router.get("/polls/:id", getPoll);
    router.post("/clickvotes", clickVotes);
    router.delete("/deletepoll", delpoll);

    //SETTING
    router.get("/profile/:id", profile);
    router.put("/setting/editProfile/:id", editProfile);
    router.put("/setting/editAccount/:id", editAccount);

    return app.use("/", router);
};
module.exports = initWebRoutes;
