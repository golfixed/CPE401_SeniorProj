import dbCon from "../../configs/DBConnection";
import express from "express";
import bcrypt from "bcryptjs";

let editAccount = express();


editAccount.put('/setting/editAccount/:id', (req, res) => {
    let id = req.params.id;
    let email = req.body.email;
    let phone = req.body.phone;
    
    let salt = bcrypt.genSaltSync(10);
    let pw = req.body.password;
    let password = bcrypt.hashSync(pw, salt);

    if (!id) {
        console.log('you didnt send ID');
        return res.status(200).send({ error: true, message: 'Please provide more information'});
    } else {

        dbCon.query('UPDATE account SET email = ?, password = ?, phone = ? WHERE id = ?', [email, password, phone, id], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.changedRows === 0) {
                console.log('There is no ID in your database');
                message = "ID not found";
            } else {
                console.log(`found id = ${id}`);
                message = "ID information successfully updated";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = editAccount;