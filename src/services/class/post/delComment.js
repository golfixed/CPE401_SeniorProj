import dbCon from "../../../configs/DBConnection";
import express from "express";

let delComment = express();

delComment.delete('/deletecomment', (req, res) => {
    let id = req.body.id;

    if (!id) {
        res.status(200).send({ error: true, message: "Please provide comment id" })
    } else {
        dbCon.query('SELECT id FROM comment WHERE id = ?', [id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let comment_id = results[0].id;
                    dbCon.query('DELETE FROM comment WHERE id = ?', comment_id, (error, results, fields) => {
                        if (error) throw error;

                        let message = "";
                        if (results.affectedRows === 0) {
                            message = `Delete failed at id = ${id}`;
                        } else {
                            message = "Comment successfully deleted";
                        }
                        return res.send({ error: false, message: message })
                    })
                } else {
                    res.status(200).send({ error: true, message: "No comment id in DB" })
                }
            }
        })
    }

})

module.exports = delComment;