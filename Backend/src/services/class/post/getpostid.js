import dbCon from "../../configs/DBConnection";
import express from "express";

let getpostid = express();

getpostid.post('/getpostid', (req, res) =>{
    let join_code =req.body.join_code;

    console.log('joincode =' + join_code);

    if(!join_code){
        res.status(400).send({error: true, message: "Please provide join code"})
    }else{
        dbCon.query("SELECT id FROM class WHERE join_code = ?", [join_code], (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `Failed `;
            }else{
                message = `Successfully`;
            }
            console.log(results)
            return res.status(200).send ({error: false, classInfo: results[0], message: message})
        })
    }
})

module.exports = getpostid;