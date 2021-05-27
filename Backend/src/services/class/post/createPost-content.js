import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPost = express();

createPost.post("/api/createcontent", (req, res) => {

    let post = {
        //REQ POST ID
        id: req.body.id,
        content: req.body.content,
        announce: req.body.announce,
        update_by: req.body.update_by,
        isShow: req.body.isShow
    }

    //Request Class id 
    if (!post.id) {
        res.status(200).send({ error: true, message: "Please provide post id" })
    } else {
        //Check if post id exist 
        dbCon.query("SELECT id FROM post WHERE id = ?", post.id, (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)
                if (results.length > 0) {
                    let post_id = results[0].id;
                    dbCon.query("UPDATE post SET content = ?, isShow = ?, announce = ? WHERE id = ?", [post.content, post.isShow, post.announce, post_id], (error, results) => {
                        if (error) throw error;

                        return res.status(200).send({
                            error: false,
                            message: "Post content successfully"
                        })
                    })
                } else {
                    res.status(200).send({ error: true, message: "No class id in DB" })
                }
            }
        })
    }
})

module.exports = createPost;