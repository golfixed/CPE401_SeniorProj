import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classCode = express();

classCode.post('/api/classroom', (req, res) => {

    let class_id = req.body.class_id;
    let account_id = req.body.account_id;

    console.log('class id = ' + class_id);
    console.log('account id = ' + account_id);

    if (!class_id || !account_id) {
        return res.status(200).send({ error: true, message: "Please provide class id & account id" });
    } else {
        dbCon.query('SELECT class_member.favorite, class.* FROM class, class_member, account WHERE class.id=class_member.class AND class.id = ? AND account.id = class_member.account AND account.id = ?', [class_id, account_id], (error, results) => {
            if (error) throw error;

            let message = "";
            if (results === undefined || results.length == 0) {
                message = `There's no class id & account id matches`;
            } else {
                message = `Done`;
            }
            return res.send({ error: false, data: results[0], message: message })
        })
    }
})

module.exports = classCode;