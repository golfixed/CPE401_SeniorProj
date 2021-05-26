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
import createPostContent from "../services/class/post/createPost-content";
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
    router.get("/", homePageController.handleHelloWorld);
    router.get("/api/login",loginController.checkLoggedOut, loginController.getPageLogin);
    router.post('/api/login', (req, res, next) => {
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
    router.get("/api/register", registerController.getPageRegister);
    router.post("/api/register", registerController.createNewUser);
    router.post("/api/addrole", addRole);
    router.post("/api/getprofileinfo", getProfileInfo);
    router.post("/api/logout", loginController.postLogOut);

    //CLASS
    router.post("/api/classrooms", classList);
    router.post("/api/classrooms/announce", classListAnnounce);
    router.post("/api/classroom", classroom);
    router.post("/api/getclassinfo", getclassinfo);
    router.post("/api/getclassid", getclassid);
    router.post("/api/pinclass", addFavClass);
    router.get("/api/classrooms/:id/discussion", discussion);
    router.post("/api/createClass", classController.createNewClass);
    router.post("/api/joinclass", joinClass);

    //PIN CLASS
    router.get("/api/pinCode/:id", getJoinCode);

    //CLASS MEMBER
    router.post("/api/classmember", classMember);
    router.delete("/api/leaveclass", delMember);

    //MATERIAL
    router.get("/api/materials/:class_id", getMaterials);
    router.post("/api/creatematerialtopic", createTopic);
    router.post("/api/postMaterial", postMaterial);
    router.delete("/api/deletematerialtopic", delMaterialTopic);
    
    //POST
    router.get("/api/getpostlist/:class_id", posttab);
    router.post("/api/createpost", createPost);
    router.post("/api/createcontent", createPostContent);
    router.get("/api/post/:id", getPost);
    router.delete("/api/deletepost", delPost);
    //COMMENT
    router.post("/api/addcomment", addComment);
    router.delete("/api/deletecomment", delComment);
    router.post("/api/announce", announce);
    
    //POLL
    router.get("/api/getpolllist/:class_id", getpollist);
    router.post("/api/createpoll", createPoll);
    router.get("/api/polls/:id", getPoll);
    router.post("/api/clickvotes", clickVotes);
    router.delete("/api/deletepoll", delpoll);

    //SETTING
    router.get("/api/profile/:id", profile);
    router.put("/api/setting/editProfile/:id", editProfile);
    router.put("/api/setting/editAccount/:id", editAccount);

    return app.use("/", router);
};
module.exports = initWebRoutes;
