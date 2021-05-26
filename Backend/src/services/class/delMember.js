import dbCon from "../../configs/DBConnection";
import express from "express";

let delMember = express();

//delete member require account id and class id
delMember.delete('/api/leaveclass', (req, res) => {

    let account_id = req.body.account_id;
    let class_id = req.body.class_id;

    if (!account_id || !class_id) {
        return res.status(200).send({ error: true, message: "Please specify class id and account id" });
    } else {
        dbCon.query('SELECT * FROM class_member WHERE account = ? AND class = ?', [account_id, class_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    var acc_id = results[0].account;

                    //DELETE COMMENT WHOSE LEAVE CLASS
                    dbCon.query("DELETE FROM comment WHERE create_by = ?", acc_id, (error, results) => {
                        if (error) throw error;

                        console.log(results)
                        if (results.affectedRows > 0) {
                            
                            dbCon.query("DELETE FROM post WHERE create_by = ?", acc_id, (error, results) => {
                                if (error) throw error;
                                console.log('del post' + results)
                                let message = "";
                                if (results.affectedRows === 0) {
                                    message = `There's no post id = ${id} `;
                                } else {
                                    message = `Delete post and comment successfully`;
                                }
                                return res.status(200).send({ error: false, data: results[0], message: message })
                            })
                            
                        } else {
                            return res.status(200).send({ error: false, data: results[0], message: "Delete failed" })
                        }
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