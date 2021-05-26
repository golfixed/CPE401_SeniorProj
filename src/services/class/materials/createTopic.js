import dbCon from "../../../configs/DBConnection";
import express from "express";

let createTopic = express();

createTopic.post("/creatematerialtopic", (req, res) => {

    let topic = {
        class: req.body.class,
        topic: req.body.topic,
        //create_by = account id
        create_by: req.body.create_by
    }
    //Request Class id 
    if (!topic.class) {
        res.status(200).send({ error: true, message: "Please provide class id" })
    } else {
        //Check if class id exist 
        dbCon.query("SELECT id FROM class WHERE id = ?", [topic.class], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    dbCon.query("INSERT INTO material_topic SET ?", topic, (error, results) => {
                        if (error) throw error;

                        return res.status(200).send({
                            error: false,
                            material_topic_id: results.insertId,
                            message: "Added material topic successfully",
                        })
                    })
                } else {
                    res.status(200).send({ error: true, message: "No class id in DB" })
                }
            }
        })
    }
})

module.exports = createTopic;