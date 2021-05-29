import dbCon from "../../../configs/DBConnection";
import express from "express";

let createChat = express();

createChat.post('/api/createchat', (req, res) => {
    let chat = {
        //Sender account id
        sender: req.body.sender,
        //Receiver account id
        receiver: req.body.receiver
    }

    if (!chat) {
        res.status(200).send({ error: true, message: "Please provide 'sender id' and 'receiver id'" })
    } else {
        dbCon.query("SELECT * FROM chatroom WHERE sender = ? AND receiver = ?", [chat.sender, chat.receiver], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    res.status(200).send({ error: true, message: "You created chatroom already" });
                } else {

                    dbCon.query("SELECT * FROM chatroom WHERE receiver = ? AND sender = ?", [chat.sender, chat.receiver], (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            if (results.length > 0) {
                                res.status(200).send({ error: true, message: "Receiver created chatroom already" });
                            } else {
                                console.log(results)

                                dbCon.query('INSERT INTO chatroom SET ?', chat, (error, results) => {
                                    if (error) { console.log(error) }

                                    return res.status(200).send({
                                        error: false,
                                        chat_id: results.insertId
                                    })
                                })
                            }
                        }

                    })
                }
            }
        })
    }
})

module.exports = createChat;