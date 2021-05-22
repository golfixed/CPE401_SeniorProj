import dbCon from "../../../configs/DBConnection";
import express from "express";

let delComment = express();

delComment.delete('/deleteComment/:id', (req, res) =>{
    let comment_id = req.params.id;

    if(!comment_id){
        res.status(400).send({error: true, message: "Please provide comment id to delete comment"})
    }else{
        dbCon.query('DELETE FROM comment WHERE id = ?', comment_id, (error, results, fields) =>{
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "No changed comment";
            } else {
                message = "Comment successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = delComment;