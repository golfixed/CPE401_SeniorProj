import dbCon from "../../../configs/DBConnection";
import express from "express";

let delComment = express();

delComment.delete('/deletecomment/:id', (req, res) =>{
    let id = req.params.id;

    if(!id){
        res.status(400).send({error: true, message: "Please provide comment id to delete comment"})
    }else{
        dbCon.query('DELETE FROM comment WHERE id = ?', id, (error, results, fields) =>{
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = `No comment id = ${id}`;
            } else {
                message = "Comment successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = delComment;