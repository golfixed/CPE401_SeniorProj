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

                    dbCon.query("SELECT post.*, account.firstname, account.lastname, account.image FROM post,account WHERE post.create_by = account.id AND post.id = ?", post_id, (error, results, fields) => {
                        if (error) throw error;
                        else {
                            if (results.length > 0) {

                                let pid = results[0];
                                dbCon.query('UPDATE post SET click_count = click_count+1 WHERE id = ?',post_id, (error, results) =>{
                                    if (error) { console.log(errer) }
                                    
                                    console.log(results)
                                    dbCon.query("SELECT comment.*, account.firstname, account.lastname, account.image FROM comment,post,account WHERE comment.post = post.id AND comment.create_by = account.id AND comment.post = ?", post_id, (error, results) => {
                                        if (error) { console.log(errer) }
    
                                        let message = "";
                                        if (results === undefined || results.length == 0) {
                                            message = `There's no comment id = ${post_id} `;
                                        } else {
                                            message = `Get post id = ${post_id} successfully`;
                                        }
                                        return res.status(200).send({ error: false, post: pid, comment: results, message: message })
                                    })
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