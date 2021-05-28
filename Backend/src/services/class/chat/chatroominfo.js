import dbCon from "../../../configs/DBConnection";
import express from "express";

let chatroominfo = express();

chatroominfo.post('/api/chatroominfo', (req, res) => {

    let chat_id = req.body.chat_id;
    //Receiver account id
    let account_id = req.body.account_id;

    if (!chat_id || !account_id) {
        res.status(200).send({ error: true, message: "Please provide  chat id and account id" });
    } else {
        //check is chat id exist
        dbCon.query("SELECT id FROM chatroom WHERE id =?", [chat_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    dbCon.query("SELECT chatroom.sender, chatroom.receiver, account.firstname, account.lastname, chatroom.favorite AS pinchat FROM chatroom,account WHERE chatroom.receiver = account.id AND chatroom.receiver = ? AND chatroom.id = ?", [account_id, chat_id], (error, results) => {
                        // dbCon.query("SELECT chatroom.sender, chatroom.receiver, account.firstname, account.lastname FROM chatroom,account WHERE chatroom.sender = account.id AND chatroom.sender = ? AND chatroom.id = ?", [account_id, chat_id], (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            if (results.length > 0) {
                                return res.status(200).send({
                                    error: false,
                                    data: results[0]
                                })
                            } else {
                                res.status(200).send({ error: true, message: "chat id and receiver id is not match" });
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

module.exports = chatroominfo;