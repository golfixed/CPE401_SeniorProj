import dbCon from "../../configs/DBConnection";
import express from "express";

let joinClass = express();

joinClass.post('/joinclass', (req, res) => {
    let join_code = req.body.join_code;
    let account_id = req.body.account_id;


    if (!join_code) {
        res.status(200).send({ error: true, message: "Please provide join code to enter class" })
    } else {
        dbCon.query('SELECT id FROM class WHERE join_code = ?', join_code, (error, results, fields) => {
            if (results === undefined || results.length == 0) {
                res.status(200).send({ error: true, message: "No class found" })
            }
            else {
                dbCon.query('INSERT INTO class_member (account, role_member, class) SELECT account.id, account.role, class.id FROM account, class WHERE join_code =? AND account.id = ?', [join_code, account_id], (error, results, fields) => {
                    if (error) throw error;

                    return res.status(200).send({
                        error: false,
                        message: "Added member successfully"
                    })
                })
            }
        })
    }

})

module.exports = joinClass;