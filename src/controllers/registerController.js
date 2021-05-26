import registerService from "./../services/registerService";
import { validationResult } from "express-validator";

//GET OUT REGISTER PAGE
let getPageRegister = (req, res) => {
    return res.send({ error: false, message: "Register Page"});
};

let createNewUser = async (req, res) => {
    console.log('----------------REGIS NEW ACCOUNT---------------');
    //validate required fields
    let errorsArr = [];
    let validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        let errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        return res.send({ error: false, message: "Register Page"});
    }
    console.log('new regis info : ');
    console.log(req.body);
    //create a new user
    let newUser = {
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        email: req.body.email,
        password: req.body.password
    };
    try {
        await registerService.createNewUser(newUser);
        console.log('New user account register successfully');
        return res.send({ error: false, data: newUser, message: "Register Successfully"})
    } catch (err) {
        req.flash("errors", err);
        console.log(err);
        return res.send({ error: false, message: err})
    }
};
module.exports = {
    getPageRegister: getPageRegister,
    createNewUser: createNewUser
};
