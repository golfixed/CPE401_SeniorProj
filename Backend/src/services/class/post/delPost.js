import dbCon from "../../../configs/DBConnection";
import express from "express";

let delPost = express();

//delete post by id
delPost.delete('/deletepost', (req, res) => {
    let id = req.body.id;

    if (!id) {
        res.status(200).send({ error: true, message: "Please provide post id" })
    } else {
        dbCon.query('SELECT * FROM post WHERE id = ?', [id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let post_id = results[0].id;
                    console.log('result id from post ' + post_id)
                    //CHECK IS COMMENT EXIST
                    dbCon.query('SELECT post FROM comment WHERE post = ?', post_id, (error, results) =>{
                        if (error) throw error;

                        if(results.length > 0){
                            //DELETE COMMENT IF THERE IS COMMENT EXIST
                            dbCon.query("DELETE FROM comment WHERE post = ?", post_id, (error, results, fields) => {
                                if (error) throw error;
        
                                console.log(results)
                                if (results.affectedRows > 0) {
                                    // message = `Delete comment id = ${id} successfully`;
                                    
                                    dbCon.query("DELETE FROM post WHERE id = ?", post_id, (error, results, fields) => {
                                        if (error) throw error;
                                        console.log('del post' + results)
                                        let message = "";
                                        if (results.affectedRows === 0) {
                                            message = `There's no post id = ${id} `;
                                        } else {
                                            message = `Delete post and comment successfully`;
                                        }
                                        return res.status(200).send({ error: false, data: results[0], message: message })
                                    })
                                    
                                } else {
                                    return res.status(200).send({ error: false, data: results[0], message: "Delete failed" })
                                }
                            })

                        }else{
                            dbCon.query("DELETE FROM post WHERE id = ?", post_id, (error, results, fields) => {
                                if (error) throw error;
                                console.log('del post' + results)
                                let message = "";
                                if (results.affectedRows === 0) {
                                    message = `There's no post id = ${id} `;
                                } else {
                                    message = `Delete post id = ${id} successfully`;
                                }
                                return res.status(200).send({ error: false, data: results[0], message: message })
                            })
                                                        
                        }
                    })

                } else {
                    res.status(200).send({ error: true, message: "No post id in DB" })
                }
            }
        })
    }
})


module.exports = delPost;