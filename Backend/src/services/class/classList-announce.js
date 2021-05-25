import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classListAnnounce = express();

classListAnnounce.post('/classrooms/announce', (req, res) => {
    //account id
    let id = req.body.id;

    //show class announce
    dbCon.query('SELECT post.announce, class.id, class.class_code,class.class_name,class.section, class.class_pic, class_member.favorite FROM post, class_member,class,account WHERE post.announce = 1 AND class_member.class=class.id=post.class AND class_member.account=account.id AND account.id= ?', [id], (error, results, fields) => {
        if (error) throw error;

        if (results === undefined || results.length == 0) {
            return res.send({ error: false, message: "No announce post from your class" })
        } else {
            return res.send({ error: false, data: results, message: "Get announce post Successfully" })
        }
    })
})

module.exports = classListAnnounce;