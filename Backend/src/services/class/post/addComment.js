import dbCon from "../../../configs/DBConnection";
import express from "express";

let addComment = express();

addComment.post('/addcomment', (req, res) =>{

    let comment = {
        post: req.body.post,
        text: req.body.text,
        create_by: req.body.create_by,
        update_by: req.body.update_by
    }

    if(!comment.post || !comment.text){
        res.status(200).send({error: true, message: "Please provide post id to add comment"})
    }else{
        dbCon.query('SELECT id FROM post WHERE id = ?', comment.post, (error, results) =>{
            if (error) {console.log(error)}
            else{
                if(results.length > 0){
                    dbCon.query('INSERT INTO comment SET ?', comment, (error, results, fields) =>{
                        if (error) throw error;
                        
                        return res.status(200).send({
                            error: false,
                            comment_id: results.insertId,
                            message: "comment successfully"
                        })
                    })
                }else{
                    res.status(200).send({error: true, message: "No comment id in DB"})
                }
            }
        })
    }
})

module.exports = addComment;