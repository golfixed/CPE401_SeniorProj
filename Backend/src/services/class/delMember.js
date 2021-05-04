import dbCon from "../../configs/DBConnection";
import express from "express";
import passport from "passport";

let app = express();

app.delete('/:class_code/deleteMember', passport.authenticate('jwt', {session: false}), (req, res) => {
    let email = req.body.email;

    if (!id || !class_code) {
        return res.status(400).send({ error: true, message: "Please provide email"});
    } else {
        dbCon.query('DELETE FROM account WHERE email = ?', [email], (error, results, fields) => {
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

module.exports = app;