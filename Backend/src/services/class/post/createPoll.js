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

    let options= req.body.options;
    
    dbCon.query('INSERT INTO poll SET ?', poll, (error, results, fields) =>{
        if (error) throw error;
        // res.send({data_poll: results});

        dbCon.query('INSERT INTO poll_option (poll) SELECT MAX(id) FROM poll',(error, results, fields) =>{
            if (error) throw error;
            console.log('insert id from poll');
            
            dbCon.query('UPDATE poll_option SET options = ? WHERE poll IN (SELECT MAX(poll) FROM poll_option)',[options], (error, results, fields) =>{
                console.log('update options');
                if (error) throw error;
                
                return res.status(200).send({
                    error: false,
                    data: results,
                    poll: poll,
                    options: options,
                    message: "create poll successfully"
                })
            })
        })
    })
})

module.exports = createPoll;