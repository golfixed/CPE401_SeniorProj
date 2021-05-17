import dbCon from "../../../configs/DBConnection";
import express from "express";

let createTopic = express();

createTopic.post("/createTopic", (req, res) => {

    let material_topic = {
        class: req.body.class,
        title: req.body.title,
        create_by: req.body.create_by
    }
    
    dbCon.query("INSERT INTO material_topic SET ?", material_topic, (error, results, fields) =>{
        if (error) throw error;

        return res.status(200).send({
          error: false,
          data: results,
          message: "Added material topic successfully",
        })
    })
})

module.exports = createTopic;