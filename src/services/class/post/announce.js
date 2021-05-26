import dbCon from "../../../configs/DBConnection";
import express from "express";
//check exist class

let announce = express();

announce.post('/announce', (req, res) => {
    let post_id = req.body.post_id;

    if (!post_id) {
        return res.status(200).send({ error: true, message: "Please provide post id" });
    } else {
        dbCon.query('SELECT announce FROM post WHERE id = ?', [post_id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let  announce = results[0].announce;
                    console.log('announce='+ announce)
                    
                    if (announce == 0) {
                        dbCon.query('UPDATE post SET announce = 1 WHERE id = ?', [post_id], (error, results, fields) => {
                            if (error) throw error;
                            return res.send({ error: false, data: results[0], message: "Set add announce to 1" })
                        })
                    } else if (announce == 1) {
                        dbCon.query('UPDATE post SET announce = 0 WHERE id = ?', [post_id], (error, results, fields) => {
                            if (error) throw error;
                            return res.send({ error: false, data: results[0], message: "Set add announce to 0" })
                        })
                    }
                } else {
                    return res.status(200).send({ error: true, message: "No post id in DB" });
                }
            }
        })
    }
})

module.exports = announce;