import dbCon from "../../configs/DBConnection";
import express from "express";

let delMember = express();

//delete member by id
delMember.delete('/deleteMember/:id', (req, res) => {
    let id = req.params.id;

    if (!id) {
        return res.status(400).send({ error: true, message: "Please specify class id or account id"});
    } else {
        dbCon.query('DELETE FROM class_member WHERE id = ?', id, (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "Member not found";
            } else {
                message = "Member successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = delMember;