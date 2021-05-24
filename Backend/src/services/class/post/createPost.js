import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPost = express();

createPost.post("/classrooms/:class/createPost", (req, res) => {
    
    let post = {
        class: req.params.class,
        content: req.body.content,
        comment: req.body.comment,
        pic_url: req.body.pic_url,
        create_by: req.body.create_by,
        update_by: req.body.update_by,
        click_count:0, 
        announce: false
    }

    if(!post.class){
        res.status(200).send({error: true, message: "Please provide class id"})
    }else{
        dbCon.query("INSERT INTO post SET ?", post, (error, results, fields) =>{
            if (error) throw error;
    
            return res.status(200).send({
              error: false,
              data: results,
              post: post,
              message: "Post successfully"
            })
        })
    }
})

module.exports = createPost;