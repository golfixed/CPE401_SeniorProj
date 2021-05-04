import dbCon from "../../configs/DBConnection";
import express from "express";
import passport from "passport";

let classCode = express();

classCode.get('/:class_code', (req, res) =>{
    let class_code = req.params.class_code;
    const {section} = req.query;
    
    if(!class_code){
        return res.status(400).send({ error: true, message: "Please provide class code"});
    }else
    {
        dbCon.query('SELECT * FROM class WHERE class_code = ? AND section = ?', [class_code, section], (error, results, fields) =>{
            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `There's no ${class_code} class or please specify the section `;
            }else{
                message = `This is ${class_code} section ${section}`;
            }
            return res.send ({error: false, data: results[0], message: message})
        })
    }
})

module.exports = classCode;