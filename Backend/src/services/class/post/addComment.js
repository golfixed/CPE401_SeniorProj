import dbCon from "../../../configs/DBConnection";
import express from "express";

let addComment = express();

addComment.post('/addComment/:post', (req, res) =>{

    let comment = {
        // pic_url
        post: req.params.post,
        text: req.body.text,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    if(!comment.post){
        res.status(400).send({error: true, message: "Please provide post id to add comment"})
    }else{
        dbCon.query('INSERT INTO comment SET ?', comment, (error, results, fields) =>{
            if (error) throw error;
    
            return res.status(200).send({
              error: false,
              data: results,
              comment: comment,
              message: "comment successfully"
            })
        })
    }
})

module.exports = addComment;