import dbCon from "../../../configs/DBConnection";
import express from "express";

let getPost = express();

getPost.get('/post/:id', (req, res) => {
    let id = req.params.id;

    if (!id) {
        res.status(200).send({ error: true, message: "Please provide post id" })
    } else {
        dbCon.query('SELECT id FROM post WHERE id = ?', [id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let post_id = results[0].id;

                    dbCon.query("SELECT * FROM post WHERE id = ?", post_id, (error, results, fields) => {
                        if (error) throw error;
                        else {
                            if (results.length > 0) {

                                let pid = results;
                                dbCon.query("SELECT comment.* FROM comment,post WHERE comment.post = post.id AND comment.post = ?", post_id, (error, results) => {
                                    if (error) { console.log(errer) }

                                    let message = "";
                                    if (results === undefined || results.length == 0) {
                                        message = `There's no comment id = ${post_id} `;
                                    } else {
                                        message = `Get post id = ${post_id} successfully`;
                                    }
                                    return res.status(200).send({ error: false, post: pid, comment: results, message: message })
                                })
                            }
                        }
                    })
                } else {
                    res.status(200).send({ error: true, message: "No post id in DB" })
                }
            }
        })
    }
})

module.exports = getPost;