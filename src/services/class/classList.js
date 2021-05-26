import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classList = express();

classList.post('/classrooms', (req, res) => {
    //REQUEST ACCOUNT ID 
    let id = req.body.id;

    dbCon.query('SELECT class.id, class.class_code,class.class_name,class.section, class.class_pic, class_member.favorite FROM class_member,class,account WHERE class_member.class=class.id AND class_member.account=account.id AND account.id= ?', [id], (error, results, fields) => {
        if (error) throw error;

        let message = "";
        if (results === undefined || results.length == 0) {
            message = `You enter no class`;
        } else {
            message = `All class list`;
        }
        return res.send({ error: false, data: results, message: message })
    })
})

module.exports = classList;