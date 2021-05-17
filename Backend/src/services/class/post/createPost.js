import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPost = express();

createPost.post("/createPost/:class", (req, res) => {

    let post = {
        class: req.params.class,
        // class_id: req.body.class,
        poll: req.body.poll,
        comment: req.body.comment,
        announce: req.body.announce,
        click_count:req.body.click_count, 
        pic_url: req.body.pic_url,
        detail: req.body.detail,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    if(!post.class){
        res.status(400).send({error: true, message: "Please provide class id"})

    }else{
        dbCon.query("INSERT INTO post SET ?", post, (error, results, fields) =>{
            if (error) throw error;
    
            return res.status(200).send({
              error: false,
              data: results,
              post: post,
              message: "Post successfully",
            })
        })
    }
})

module.exports = createPost;