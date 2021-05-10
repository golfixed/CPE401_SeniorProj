import dbCon from "../configs/DBConnection";
import express from "express";
import passport from "passport";

let createClass = express();

createClass.post('/class/createClass', passport.authenticate('jwt', {session: false}), (req, res)=> {
    let classObject = {
        class_code: req.body.class_code,
        class_name: req.body.class_name,
        class_desc: req.body.class_desc,
        class_pic: req.body.class_pic,
        section: req.body.section
    };

        if(!classObject.class_code || !classObject.class_name || !classObject.section){
                return res.status(400).send({ error: true, message: "This class already exist"});
        }else{
            dbCon.query('INSERT INTO class SET ?', classObject, (error, results, fields) =>{
                if(error) throw error;
                return res.send({error: false, message: "Class Added"});
            })
        }
})

module.exports = createClass;
