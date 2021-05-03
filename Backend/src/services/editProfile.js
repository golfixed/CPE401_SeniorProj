import dbCon from "../configs/DBConnection";
import express from "express";
import passport from "passport";

let app = express();


app.put('/profile/editProfile', passport.authenticate('jwt', {session: false}), (req, res) => {
    let id = req.body.id;
    let firstname = req.body.firstname;
    let lastname = req.body.lastname;
    let email = req.body.email;
    let password = req.body.password;
    let role = req.body.role;
    let image = req.body.image;
    let gender = req.body.gender;
    let phone = req.body.phone;

    // validation
    // if (!id || !firstname || !lastname || !email || !password || !role || !image || !gender || !phone) {
    if (!id || !firstname || !lastname || !email || !password) {
        return res.status(400).send({ error: true, message: 'Please provide more information'});
    } else {
        dbCon.query('UPDATE account SET firstname = ?, lastname = ?, email = ?, password = ?, role = ?, image = ?, gender = ?, phone = ? WHERE id = ?', [firstname, lastname, email, password, role, image, gender, phone, id], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.changedRows === 0) {
                message = "ID not found or data are same";
            } else {
                message = "ID information successfully updated";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = app;