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
        dbCon.query("SELECT id FROM account WHERE id IN (?, ?)", [chat.sender, chat.receiver], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {

                    console.log(results)
                    // let from_id = results[0];
                    // let to_id = results[1];

                    dbCon.query('INSERT INTO chatroom SET ?', chat, (error, results) => {
                        if (error) { console.log(error) }

                        return res.status(200).send({
                            error: false,
                            chat_id: results.insertId
                        })
                    })
                } else {
                    res.status(200).send({ message: "No id in this DB" });
                }
            }
        })
    }
})

module.exports = createChat;