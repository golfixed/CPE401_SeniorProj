import dbCon from "../../../configs/DBConnection";
import express from "express";

let chatmessage = express();

chatmessage.post('/api/sendmessage', (req, res) => {
    //sender id = account id 
    let send_message = {
        chatroom: req.body.chatroom,
        text: req.body.text,
        create_by: req.body.create_by
    }

    if (!send_message) {
        res.status(200).send({ error: true, message: "Please provide sender id, receiver_id, chatroom, text !" })
    } else {
        //check exist chatroom
        dbCon.query("SELECT id FROM chatroom WHERE id = ?", [send_message.chatroom], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {

                    let chat_id = results[0].id;
                    console.log(chat_id)
                    dbCon.query('SELECT * FROM chatroom WHERE id = ? AND sender = ? OR receiver = ? ', [chat_id, send_message.create_by, send_message.create_by], (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            if (results.length > 0) {
                                //get message
                                dbCon.query('INSERT INTO message(chatroom, text, create_by) VALUES(?, ?, ?)', [send_message.chatroom, send_message.text, send_message.create_by], (error, results) => {
                                    if (error) { console.log(error) }
                                    else {
                                        if (results.affectedRows > 0) {

                                            return res.status(200).send({
                                                error: false,
                                                message_id: results.insertId,
                                                message: "Done"
                                            })
                                        }
                                    }
                                })
                            } else {
                                res.status(200).send({ error: true, message: "chatroom id and accound id not match" })
                            }
                        }
                    })
                } else {
                    res.status(200).send({ error: true, message: "No chatroom id in this DB" })
                }
            }
        })
    }
})

module.exports = chatmessage;