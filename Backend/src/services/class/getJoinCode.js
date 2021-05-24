import dbCon from "../../configs/DBConnection";
import express from "express";

let getJoinCode = express();

getJoinCode.get('/pinCode/:id', (req, res) =>{
    let id =req.params.id;

    if(!id){
        res.status(200).send({error: true, message: "Please provide post id"})
    }else{
        dbCon.query("SELECT join_code FROM class WHERE id = ?", id, (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no id = ${id} `;
            }else{
                message = `Get pin code from class id = ${id} successfully`;
            }
            console.log(results)
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }
})

module.exports = getJoinCode;