import dbCon from "../../configs/DBConnection";
import express from "express";

let delMember = express();

//delete member require account id and class id
delMember.delete('/deletemember', (req, res) => {

    let account_id = req.body.account_id;
    let class_id = req.body.class_id;

    if (!account_id || !class_id) {
        return res.status(200).send({ error: true, message: "Please specify class id and account id" });
    } else {
        dbCon.query('SELECT id FROM class_member WHERE account = ? AND class = ?', [account_id, class_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    var member_id = results[0].id;

                    dbCon.query('DELETE FROM class_member WHERE id = ?', [member_id], (error, results, fields) => {
                        if (error) throw error;

                        return res.status(200).send({
                            error: false,
                            message: "Deleted member successfully"
                        })
                    })
                } else {
                    console.log('NO RESULT')
                    res.status(200).send({ error: true, message: `No member id this class` })
                }
            }
        })
    }
})

module.exports = delMember;