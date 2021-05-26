import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPost = express();

createPost.post("/api/createpost", (req, res) => {
    
    let post = {
        class: req.body.class,
        create_by: req.body.create_by
    }

    //Request Class id 
    if(!post.class){
        res.status(200).send({error: true, message: "Please provide class id"})
    }else{
        //Check if class id exist 
        dbCon.query("SELECT id FROM class WHERE id = ?",post.class, (error, results) =>{
            if(error) {console.log(error)}
            else{
                console.log(results)

                if(results.length > 0){
                    dbCon.query("INSERT INTO post SET ?", post, (error, results) =>{
                        if (error) throw error;

                        return res.status(200).send({
                            error: false,
                            post_id: results.insertId,
                        })
                    })
                }else{
                    res.status(200).send({error: true, message: "No class id in DB"})
                }
            }
        })
    }
})

module.exports = createPost;