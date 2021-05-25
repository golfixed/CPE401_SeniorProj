import dbCon from "../../../configs/DBConnection";
import express from "express";
//check exist class

let getpolllist = express();

getpolllist.get('/getpolllist/:class_id', (req, res) => {
    let class_id = req.params.class_id;

    if (!class_id) {
        res.status(200).send({ error: true, message: "Please provide class id" })
    } else {
        dbCon.query('SELECT id FROM class WHERE id = ?', [class_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    dbCon.query("SELECT * FROM poll WHERE class = ?", class_id, (error, results, fields) => {
                        if (error) throw error;

                        let message = "";
                        if (results === undefined || results.length == 0) {
                            message = `There's no post in class id = ${class_id} `;
                        } else {
                            message = `Get poll in class id = ${class_id} successfully`;
                        }
                        return res.status(200).send({ error: false, data: results, message: message })
                    })
                } else {
                    res.status(200).send({ error: true, message: "No class id in DB" })
                }
            }
        })
    }
})

module.exports = getpolllist;