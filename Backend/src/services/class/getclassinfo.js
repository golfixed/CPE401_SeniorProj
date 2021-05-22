import dbCon from "../../configs/DBConnection";
import express from "express";

let getclassinfo = express();

getclassinfo.get('/getclassinfo', (req, res) =>{
    let class_code =req.body.class_code;
    let section = req.body.section

    if(!class_code || !section){
        res.status(400).send({error: true, message: "Please provide class code and section"})
    }else{
        dbCon.query("SELECT id,join_code FROM class WHERE class_code = ? AND section = ?", [class_code, section], (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `Failed `;
            }else{
                message = `Successfully`;
            }
            console.log(results)
            return res.status(200).send ({error: false, classInfo: results, message: message})
        })
    }
})

module.exports = getclassinfo;