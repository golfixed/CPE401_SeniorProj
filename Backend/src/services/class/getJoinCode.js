import dbCon from "../../configs/DBConnection";
import express from "express";

let getJoinCode = express();

getJoinCode.get('/pinCode/:id', (req, res) =>{
    let id =req.params.id;
    let join_code =req.body.join_code;

    if(!id){
        res.status(400).send({error: true, message: "Please provide post id"})
    }else{
        dbCon.query("SELECT join_code FROM class WHERE id = ?", id, (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no post id = ${id} `;
            }else{
                message = `Get post id = ${id} successfully`;
            }
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }

})

module.exports = getJoinCode;