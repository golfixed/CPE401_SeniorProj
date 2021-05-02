import dbCon from "../configs/DBConnection";
import express from "express";
import passport from "passport";


let createClass = express();

createClass.post('/class/createClass', passport.authenticate('jwt', {session: false}), (req, res)=> {
    let class_code = req.body.class_code;
    let class_name = req.body.class_name;
    let class_desc = req.body.class_desc;
    let class_pic = req.body.class_pic;
    let section = req.body.section;

    if(!class_code || !class_name || !section){
        return res.status(400).send({ error: true, message: "Please provide more information."});
    }else{
        dbCon.query('INSERT INTO class (class_code, class_name, section) VALUES (?, ? ,?)', [class_code, class_name, section], (error, results, fields) =>{
            if(error) throw error;
            return res.send({error: false, message: "Class Added"});
        })
    }
})

module.exports = createClass;