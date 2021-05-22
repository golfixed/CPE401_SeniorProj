import dbCon from "../../../configs/DBConnection";
import express from "express";
//check exist class

let getPoll = express();

getPoll.get('/polls/:id', (req, res) =>{
    let id = req.params.id;

    dbCon.query('SELECT * FROM poll WHERE id = ?',[id],(error, results, fields) =>{
        if(error) throw error;
        
        let message ="";
        if(results === undefined || results.length == 0){
            message = `There's no poll id = ${id}`;
        }else{
            message = `Request poll id = ${id} successfully`;
        }
        return res.send ({error: false, data: results, message: message})
    })
})

module.exports = getPoll;