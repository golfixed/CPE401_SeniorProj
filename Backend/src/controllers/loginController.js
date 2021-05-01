import { validationResult } from "express-validator";
import loginService from "../services/loginService";

//GET OUR LOGIN PAGE
let getPageLogin = (req, res) => {
    // return res.render("login.ejs", {
    //     errors: req.flash("errors")
    // });
    return res.send({ error: false, message: "Login Page"});
};

let handleLogin = async (req, res) => {
    let errorsArr = [];
    let validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        let errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        // return res.redirect("/login");
        return res.send({ error: false, message: "Login Successfully"});
    }

    try {
        await loginService.handleLogin(req.body.email, req.body.password);
        return res.redirect("/");
    } catch (err) {
        req.flash("errors", err);
        // return res.redirect("/login");
        return res.send({ error: false, message: "Login Failed"});
    }
};

let checkLoggedIn = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return res.redirect("/login");
    }
    next();
};

let checkLoggedOut = (req, res, next) => {
    if (req.isAuthenticated()) {
        return res.redirect("/");
    }
    next();
};

let postLogOut = (req, res) => {
    req.session.destroy(function(err) {
        return res.redirect("/login");
    });
};

module.exports = {
    getPageLogin: getPageLogin,
    handleLogin: handleLogin,
    checkLoggedIn: checkLoggedIn,
    checkLoggedOut: checkLoggedOut,
    postLogOut: postLogOut
};
