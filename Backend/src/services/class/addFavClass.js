import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let addFavClass = express();

//
addFavClass.post('/pinclass', (req, res) => {
    let account_id = req.body.account_id;
    let class_id = req.body.class_id;

    if (!account_id || !class_id) {
        return res.status(200).send({ error: true, message: "Please provide class id and account id" });
    } else {
        dbCon.query('SELECT favorite FROM class_member WHERE account = ? AND class = ?', [account_id, class_id], (error, results) => {
            if (error) { console.log(error) }

            else {
                if (results.length > 0) {
                    let fav = results[0].favorite;
                    if (fav == 0) {
                        dbCon.query('UPDATE class_member SET favorite = 1 WHERE account = ? AND class = ?', [account_id, class_id], (error, results, fields) => {
                            if (error) throw error;

                            let message = "";
                            if (results === undefined || results.length == 0) {
                                message = `There's no class id = ${id}`;
                            } else {
                                message = `Set add favorite to 1`;
                            }
                            return res.send({ error: false, data: results[0], message: message })
                        })
                    } else if (fav == 1) {
                        dbCon.query('UPDATE class_member SET favorite = 0 WHERE account = ? AND class = ?', [account_id, class_id], (error, results, fields) => {
                            if (error) throw error;

                            let message = "";
                            if (results === undefined || results.length == 0) {
                                message = `There's no class id = ${id}`;
                            } else {
                                message = `Set add favorite to 0`;
                            }
                            return res.send({ error: false, data: results[0], message: message })
                        })
                    }
                } else {
                    return res.status(200).send({ error: true, message: "No class exist" });
                }
            }
        })
    }
})

module.exports = addFavClass;