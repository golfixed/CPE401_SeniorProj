import dbCon from "../../../configs/DBConnection";
import express from "express";

let postMaterial = express();

postMaterial.post("/postMaterial", (req, res) => {

    let material ={
        title: req.body.title,
        material_topic: req.body.material_topic,
        material_url: req.body.material_url,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    if(!material.material_topic){
        res.status(200).send({error: true, message: "Please select TOPIC to add material"})

    }else{
        dbCon.query("INSERT INTO material SET ?", material, (error, results, fields) =>{
            if (error) throw error;
    
            return res.status(200).send({
              error: false,
              data: results,
              material: material,
              message: "Added material successfully",
            })
        })
    }
})

module.exports = postMaterial;