import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classListAnnounce = express();

classListAnnounce.post('/classrooms/announce', (req, res) => {
    //account id
    let id = req.body.id;

    dbCon.query('SELECT account FROM class_member WHERE account = ?', id, (error, results) => {
        if (error) throw error;
        //account id exist in class
        if (results.length > 0) {
            let account_id = results[0].id;
            console.log(account_id)

            //show class announce
            dbCon.query('SELECT post.announce, class.id AS class_id, class.class_code,class.class_name,class.section, post.id AS post_id, post.content AS post_content, post.create_at FROM post, class_member,class,account WHERE class_member.class=class.id AND class_member.class = post.class AND class_member.account=account.id AND post.announce = 1 AND account.id= ?', [id], (error, results, fields) => {
                if (error) throw error;

                if (results === undefined || results.length == 0) {
                    return res.send({ error: false, message: "No announce post for your account id" })
                } else {
                    return res.send({ error: false, data: results, message: "Get announce post Successfully" })
                }
            })
        } else {
            return res.send({ error: false, message: "You enter no class" })
        }
    })
})

module.exports = classListAnnounce;