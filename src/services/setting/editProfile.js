import dbCon from "../../configs/DBConnection";
import express from "express";

let editProfile = express();


editProfile.put('/setting/editProfile/:id', (req, res) => {
    let id = req.params.id;
    let firstname = req.body.firstname;
    let lastname = req.body.lastname;
    let role = req.body.role;
    let image = req.body.image;
    let gender = req.body.gender;
    
    if (!id) {
        return res.status(200).send({ error: true, message: 'Please provide more information'});
    } else {
        dbCon.query('UPDATE account SET firstname = ?, lastname = ?, role = ?, image = ? WHERE id = ?', [firstname, lastname, role, image, id], (error, results, fields) => {
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

module.exports = editProfile;