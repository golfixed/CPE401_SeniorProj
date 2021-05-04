import dbCon from "../../configs/DBConnection";
import express from "express";
import passport from "passport";

let classCode = express();

classCode.get('/:class_code', passport.authenticate('jwt', {session: false}), (req, res) =>{
    let class_code = req.params.class_code;
    
    if(!class_code){
        return res.status(400).send({ error: true, message: "Please provide class code"});
    }else
    {
        dbCon.query('SELECT * FROM class WHERE class_code = ?', class_code, (error, results, fields) =>{
            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `No ${class_code} class`;
            }else{
                message = `This is ${class_code}`;
            }
            return res.send ({error: false, data: results[0], message: message})
        })
    }
})

module.exports = classCode;