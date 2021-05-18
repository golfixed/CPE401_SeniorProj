import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPoll = express();

createPoll.post('/createPoll', (req, res) => {
    let poll = {
        published: req.body.published,
        expired: req.body.expired,
        content: req.body.content,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    // let poll_option = {
    //     poll_id: req.body.poll,
    //     content: req.body.content
    // }

    dbCon.query('INSERT INTO poll SET ?', poll, (error, results, fields) =>{
        if (error) throw error;
        
        dbCon.query('INSERT INTO poll_option (poll) SELECT id FROM poll;',(error, results, fields) =>{
            if (error) throw error;
            console.log('insert id from poll');
            return res.status(200).send({
              error: false,
              data: results,
              poll: poll,
              message: "create poll successfully"
            })
        })

    })
    
})

module.exports = createPoll;