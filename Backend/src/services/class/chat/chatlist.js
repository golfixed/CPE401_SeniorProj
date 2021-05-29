import dbCon from "../../../configs/DBConnection";
import express from "express";

let chatlist = express();

chatlist.post('/api/chatlist', (req, res) => {
    //request account id
    let account_id = req.body.account_id;

    if (!account_id) {
        res.status(200).send({ error: true, message: "Please provide account id" })
    } else {
        dbCon.query("SELECT * FROM chatroom WHERE sender =? OR receiver = ?", [account_id, account_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let chatlist = results;
                    console.log(chatlist);
                    //if account id is sender
                    dbCon.query('SELECT chatroom.sender FROM chatroom, account WHERE chatroom.sender = account.id AND account.id = ?', [account_id], (error, results) => {
                        if (error) { console.log(error) }
                        else {
                            //return sender
                            if (results.length > 0) {
                                let sender = results[0].sender;
                                console.log('sender =' + sender);
                                //account is sender
                                dbCon.query('SELECT chatroom.id AS chat_id, chatroom.isLeave,  account.id AS chat_with,class.class_code,class.class_name, account.firstname, account.lastname, account.image FROM chatroom, account ,class,class_member WHERE chatroom.receiver = account.id AND class_member.account = chatroom.receiver AND class_member.class = class.id AND chatroom.sender =?', [sender], (error, results) => {
                                    let datareceiver = results;
                                    //if account id is receiver return sender
                                    dbCon.query('SELECT chatroom.id AS chat_id, chatroom.isLeave, account.id AS chat_with,class.class_code,class.class_name, account.firstname, account.lastname, account.image FROM chatroom, account,class,class_member WHERE chatroom.sender = account.id  AND class_member.account = chatroom.sender AND class_member.class = class.id AND chatroom.receiver =?', [sender], (error, results) => {
                                        let datasender = results;

                                        if (error) { console.log(error) }
                                        console.log('receiver = ' + results)
                                        console.log('sender =' + sender);

                                        return res.status(200).send({
                                            error: false,
                                            Sender: datasender,
                                            Receiver: datareceiver
                                        })
                                    })
                                })
                                //This account is a receiver
                            } else {
                                dbCon.query('SELECT chatroom.receiver FROM chatroom, account WHERE chatroom.receiver = account.id AND account.id = ?', [account_id], (error, results) => {
                                    if (error) { console.log(error) }
                                    else {
                                        //return receiver
                                        if (results.length > 0) {
                                            let receiver = results[0].receiver;
                                            console.log('receiver =' + receiver);
                                            //account is receiver
                                            dbCon.query('SELECT chatroom.id AS chat_id, chatroom.isLeave,class.class_code,class.class_name, account.id AS chat_with, account.firstname, account.lastname, account.image FROM chatroom, account,class,class_member WHERE chatroom.sender = account.id AND class_member.account = chatroom.sender AND class_member.class = class.id AND chatroom.receiver =?', [receiver], (error, results) => {
                                                let datasender = results;
                                                //if account id is receiver return sender
                                                dbCon.query('SELECT chatroom.id AS chat_id, chatroom.isLeave,class.class_code,class.class_name, account.id AS chat_with, account.firstname, account.lastname, account.image FROM chatroom, account,class,class_member WHERE chatroom.receiver = account.id AND class_member.account = chatroom.receiver AND class_member.class = class.id AND chatroom.sender =?', [receiver], (error, results) => {
                                                    let datareceiver = results;

                                                    if (error) { console.log(error) }
                                                    console.log('sender = ' + results)
                                                    console.log('receiver =' + receiver);

                                                    return res.status(200).send({
                                                        error: false,
                                                        Sender: datasender,
                                                        Receiver: datareceiver
                                                    })
                                                })
                                            })
                                        } else {
                                            res.status(200).send({ error: true, message: "Empty chat" });
                                        }
                                    }
                                })
                            }
                        }
                    })
                } else {
                    res.status(200).send({ error: true, message: "Empty chat" });
                }
            }
        })
    }
})

module.exports = chatlist;