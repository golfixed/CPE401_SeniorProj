import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPoll = express();

createPoll.post('/createpoll', (req, res) => {
    let poll = {
        class: req.body.class,
        published: req.body.published,
        expired: req.body.expired,
        content: req.body.content,
        options: req.body.options,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    if (!poll.options || !poll.class || !poll.content) {
        res.status(200).send({ error: true, message: "Class id, Poll options, Content can't be null" })
    } else {
        dbCon.query("SELECT id FROM class WHERE id = ?", [poll.class], (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)

                if (results.length > 0) {
                    dbCon.query('INSERT INTO poll SET ?', poll, (error, results, fields) => {
                        if (error) throw error;

                        return res.status(200).send({
                            error: false,
                            poll_id: results.insertId,
                            message: "poll added"
                        })
                    })
                } else {
                    res.status(200).send({ error: true, message: "No class id in DB" })
                }
            }
        })
    }
})

module.exports = createPoll;