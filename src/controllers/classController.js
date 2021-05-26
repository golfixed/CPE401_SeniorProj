import classService from "../services/class/classService";
import { validationResult } from "express-validator";

//GET OUT REGISTER PAGE
let getPageClass = (req, res) => {
    return res.send({ error: false, message: "Class Page"});
};

let createNewClass = async (req, res) => {
    //validate required fields
    let errorsArr = [];
    let validationErrors = validationResult(req);
    if (!validationErrors.isEmpty()) {
        let errors = Object.values(validationErrors.mapped());
        errors.forEach((item) => {
            errorsArr.push(item.msg);
        });
        req.flash("errors", errorsArr);
        return res.send({ error: false, message: "Class Page"});
    }

    //create a new class
    let classObject = {
        class_code: req.body.class_code,
        class_name: req.body.class_name,
        class_desc: req.body.class_desc,
        section: req.body.section,
        create_by: req.body.create_by
    };
    try {
        await classService.createNewClass(classObject);
        // return res.redirect("/login");
        return res.send({ error: false, message: "OK"})
    } catch (err) {
        req.flash("errors", err);
        // return res.redirect("/register");
        // if(classObject.class_code)
        console.log('error' + err);
        return res.send({ error: false, message: "This class has already exist."})
    }
};
module.exports = {
    getPageClass: getPageClass,
    createNewClass: createNewClass
};
