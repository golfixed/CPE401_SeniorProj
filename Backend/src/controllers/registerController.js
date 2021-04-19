import registerService from "./../services/registerService";
import { validationResult } from "express-validator";

//GET OUT REGISTER PAGE
let getPageRegister = (req, res) => {
    return res.send({ error: false, message: "Register Page"});
};

let createNewUser = async (req, res) => {
    //validate required fields
    let errorsArr = [];
    let validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        let errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        // return res.redirect("/register");
        return res.send({ error: false, message: "Register Page"});
    }

    //create a new user
    let newUser = {
        fullname: req.body.fullName,
        email: req.body.email,
        password: req.body.password
    };
    try {
        await registerService.createNewUser(newUser);
        // return res.redirect("/login");
        return res.send({ error: false, message: "Register Successfully"})
    } catch (err) {
        req.flash("errors", err);
        // return res.redirect("/register");
        return res.send({ error: false, message: "Register Failed"})
    }
};
module.exports = {
    getPageRegister: getPageRegister,
    createNewUser: createNewUser
};
