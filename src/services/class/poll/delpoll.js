import dbCon from "../../../configs/DBConnection";
import express from "express";

let delpoll = express();

delpoll.delete('/deletepoll', (req, res) => {
    //REQUEST POLL ID
    let id = req.body.id;

    if (!id) {
        res.status(200).send({ error: true, message: "Please provide poll id" })
    } else {
        dbCon.query('SELECT id FROM poll WHERE id = ?', [id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let poll_id = results[0].id;
                    dbCon.query('DELETE FROM poll WHERE id = ?', poll_id, (error, results) => {
                        if (error) throw error;
                        
                        let message = "";
                        if (results.affectedRows === 0) {
                            message = `Delete failed at id = ${id}`;
                        } else {
                            message = "Poll successfully deleted";
                        }
                        return res.send({ error: false, message: message })
                    })
                }else{
                    res.status(200).send({ error: true, message: "No poll id in DB" })
                }
            }
        })
    }

})

module.exports = delpoll;