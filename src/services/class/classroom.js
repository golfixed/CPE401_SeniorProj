import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classCode = express();

//
classCode.get('/classrooms/:id', (req, res) => {
    let id = req.params.id;
    console.log(req.params)

    if (!id) {
        return res.status(200).send({ error: true, message: "Please provide class id" });
    } else {
        dbCon.query('SELECT * FROM class WHERE id = ?', [id], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results === undefined || results.length == 0) {
                message = `There's no class id = ${id}`;
            } else {
                message = `This is class id ${id}`;
            }
            return res.send({ error: false, data: results[0], message: message })
        })
    }
})

module.exports = classCode;