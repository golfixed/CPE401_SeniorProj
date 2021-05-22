import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPoll = express();

createPoll.post('/createPoll', (req, res) => {
    let poll = {
        published: req.body.published,
        expired: req.body.expired,
        content: req.body.content,
        option1: req.body.option1,
        option2: req.body.option2,
        option3: req.body.option3,
        option4: req.body.option4,
        option5: req.body.option5,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }
    
    if(!poll.option1 || !poll.option2){
        res.status(400).send({error: true, message: "Please provide at least 2 options"})
    }
    dbCon.query('INSERT INTO poll SET ?', poll, (error, results, fields) =>{
        if (error) throw error;

        return res.status(200).send({
            error: false,
            data: results,
            poll: poll,
            message: "create poll successfully"
        })
    })
})

module.exports = createPoll;