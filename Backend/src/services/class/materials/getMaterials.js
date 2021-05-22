import dbCon from "../../../configs/DBConnection";
import express from "express";

let getMaterials = express();

getMaterials.get('/materials/:id', (req, res) =>{
    let id = req.params.id;

    if(!id){
        res.status(400).send({error: true, message: "Please provide material id"})
    }else{
        // dbCon.query("SELECT class.class_code, class.class_name,class.section, material_topic.title, material.title, material.create_at FROM class,material_topic,material WHERE class.id = material_topic.class?", id, (error, results, fields) =>{
        dbCon.query("SELECT material_topic.topic, material.title, material.create_at FROM material_topic,material,class WHERE class.id = material_topic.class = ?", id, (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no material id = ${id} `;
            }else{
                message = `Get material id = ${id} successfully`;
            }
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }

})

module.exports = getMaterials;