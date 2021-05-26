import dbCon from "../../../configs/DBConnection";
import express from "express";

let delMaterial = express();

//delete member by id
delMaterial.delete('/deleteMaterial/:id', (req, res) => {
    let id = req.params.id;

    if (!id) {
        return res.status(200).send({ error: true, message: "Please specify material id"});
    } else {
        dbCon.query('DELETE FROM material WHERE id = ?', id, (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "Material not found";
            } else {
                message = "Material successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = delMaterial;