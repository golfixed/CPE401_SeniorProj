import dbCon from "../../../configs/DBConnection";
import express from "express";

let delPost = express();

//delete post by id
delPost.delete('/deletePost/:id', (req, res) => {
    let id = req.params.id;

    if (!id) {
        return res.status(200).send({ error: true, message: "Please specify class id or account id"});
    } else {
        dbCon.query('DELETE FROM post WHERE id = ?', id, (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "Post not found";
            } else {
                message = "Post successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

module.exports = delPost;