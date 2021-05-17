import dbCon from "../../../configs/DBConnection";
import express from "express";

let createTopic = express();

createTopic.post("/createTopic", (req, res) => {
    // let id = req.body.id;
    let material = {
        title: req.body.title,
        create_by: req.body.create_by
    }

    // dbCon.query("INSERT INTO material_topic (title, create_at, create_by, update_at, update_by) VALUES ('Hello2', current_timestamp(), 1, current_timestamp(), 1);", (error, results, fields) =>{
    dbCon.query("INSERT INTO material_topic SET ?", material, (error, results, fields) =>{
        if (error) throw error;

        return res.status(200).send({
          error: false,
          data: results,
          message: "Added material topic successfully",
        })
    })
})

module.exports = createTopic;