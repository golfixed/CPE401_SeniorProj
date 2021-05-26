import dbCon from "../../configs/DBConnection";
import express from "express";

let classMember = express();

classMember.post("/classmember", (req, res) => {

    let class_id = req.body.class_id;

    console.log(req.body.class_id);

    if (!class_id) {
        return res.status(200).send({ error: true, message: "Please provide class id" });
    } else {
        dbCon.query("SELECT id FROM class WHERE id = ?", [class_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)

                if (results.length > 0) {
                    let cid = results[0].id;
                    dbCon.query('SELECT class_member.id, account.firstname, account.lastname, account.image, account.role, account.id AS account_id FROM class_member,class,account WHERE class_member.class=class.id AND class_member.account=account.id AND class.id= ?', [cid], (error, results, fields) => {

                        if (error) throw error;
                        let message = "";
                        if (results === undefined || results.length == 0) {
                            message = `There's no members in class id = ${class_id}`;
                        } else {
                            message = `Request members in  class id = ${class_id} successfully`;
                        }
                        console.log(message);
                        return res.status(200).send({ error: false, data: results, message: message })
                    })

                } else {
                    console.log('NO RESULT')
                    res.status(200).send({ error: true, message: `No class id in DB` })
                }
            }
        })
    }
})

module.exports = classMember;
