import dbCon from "../../../configs/DBConnection";
import express from "express";

let chatmessage = express();

chatmessage.post('/api/chatmessage', (req, res) => {

    let chatroom = req.body.chatroom;
    let account_id = req.body.account_id;

    if (!chatroom || !account_id) {
        res.status(200).send({ error: true, message: "Please provide chat id and account id" })
    } else {
        dbCon.query("SELECT id FROM chatroom WHERE id = ?", chatroom, (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)
                if (results.length > 0) {
                    //check chatroom id match account id 
                    dbCon.query("SELECT * FROM chatroom WHERE id = ? AND sender = ? OR receiver = ?", [chatroom, account_id, account_id], (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            console.log(results)
                            if (results.length > 0) {
                                //get message id and photo
                                dbCon.query('SELECT message.id, message.create_by, message.create_at, message.text FROM message, chatroom, account WHERE message.chatroom = chatroom.id AND message.create_by = account.id AND message.chatroom = ?', [chatroom], (error, results) => {
                                    if (error) { console.log(error) }
                                    else {
                                        if (results.length > 0) {

                                            return res.status(200).send({
                                                error: false,
                                                data: results
                                            })
                                        }
                                    }
                                })
                            } else {
                                res.status(200).send({ error: true, message: "Chatroom id and account not match in DB" })
                            }
                        }
                    })
                } else {
                    res.status(200).send({ error: true, message: "No chatroom id in DB" });
                }
            }
        })
    }
})

module.exports = chatmessage;