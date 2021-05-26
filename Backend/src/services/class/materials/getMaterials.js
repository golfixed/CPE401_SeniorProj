import dbCon from "../../../configs/DBConnection";
import express from "express";

let getMaterials = express();

getMaterials.get('/materials/:class_id', (req, res) =>{
    let class_id = req.params.class_id;

    if(!class_id){
        res.status(200).send({error: true, message: "Please provide class id"})
    }else{
        dbCon.query("SELECT material_topic.topic, material.title, material.material_url, material.create_at FROM material_topic,material,class WHERE class.id = material_topic.class = ?", class_id, (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no material id = ${class_id} `;
            }else{
                message = `Get material id = ${class_id} successfully`;
            }
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }

})

module.exports = getMaterials;