import dbCon from "../../../configs/DBConnection";
import express from "express";

let clickVotes = express();

clickVotes.post('/clickVotes', (req, res) => {
    //options id
    let id = req.body.id;
    let options = req.body.options;
    
    if(!id){
        res.status(200).send({error: true, message: "Please provide at least 2 options"})
    }
    dbCon.query('UPDATE poll SET options = ? WHERE published = 1 AND id = ?', [options, id], (error, results, fields) =>{
        if (error) throw error;

        return res.status(200).send({
            error: false,
            data: results,
            options: options,
            message: "vote successfully"
        })
    })
})

module.exports = clickVotes;