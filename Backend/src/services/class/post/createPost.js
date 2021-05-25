import dbCon from "../../../configs/DBConnection";
import express from "express";

let createPost = express();

createPost.post("/classrooms/:class/createPost", (req, res) => {
    
    let post = {
        class: req.params.class,
        content: req.body.content,
        pic_url: req.body.pic_url,
        //create_by = account id
        create_by: req.body.create_by,
        update_by: req.body.update_by,
        click_count:0, 
        announce: false
    }

    //Request Class id 
    if(!post.class){
        res.status(200).send({error: true, message: "Please provide class id"})
    }else{
        //Check if class id exist 
        dbCon.query("SELECT id FROM class WHERE id = ?",[post.class], (error, results) =>{
            if(error) {console.log(error)}
            else{
                console.log(results)
                if(results.length > 0){
                    dbCon.query("INSERT INTO post SET ?", post, (error, results, fields) =>{
                        if (error) throw error;
                        
                        return res.status(200).send({
                            error: false,
                            data: results,
                            post: post,
                            message: "Post successfully"
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