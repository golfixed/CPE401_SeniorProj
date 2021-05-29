import dbCon from "../../../configs/DBConnection";
import express from "express";

let leavechat = express();

leavechat.delete('/api/leavechat', (req, res) => {
    let chat_id = req.body.chat_id;
    //Sender account id?
    let account_id = req.body.account_id;
    let isLeave = req.body.isLeave;

    if (!chat_id || !account_id) {
        res.status(200).send({ error: true, message: "Please provide  chat id and account id" });
    } else {
        //check is chat id exist and match account id
        dbCon.query("SELECT chatroom.id, chatroom.sender AS account_id FROM chatroom, account WHERE chatroom.id =? AND chatroom.sender = account.id AND account.id=?", [chat_id, account_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    console.log(results)
                    //set isLeave = 1
                    dbCon.query("UPDATE chatroom SET isLeave = 1 WHERE id = ?", (chat_id), (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            if (results.affectedRows > 0) {

                                return res.status(200).send({
                                    error: false,
                                    message: "Done"
                                })
                            }
                        }
                    })
                } else {
                    res.status(200).send({ error: true, message: "No chatroom id in this DB" });
                }
            }
        })
    }
})
module.exports = leavechat;