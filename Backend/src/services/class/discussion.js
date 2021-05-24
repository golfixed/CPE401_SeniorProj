import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let discussion = express();

discussion.get('/classrooms/:id/discussion', (req, res) =>{
    let id = req.params.id;

    if(!id){
        return res.status(400).send({ error: true, message: "Please provide class id"});
    }else
    {
        let sql = 'SELECT poll.id,poll.content,poll.create_at,poll.create_by,account.firstname,account.lastname FROM poll,account WHERE poll.class= ? AND poll.create_by = account.id UNION SELECT post.id,post.content,post.create_at,post.create_by,account.firstname,account.lastname FROM post,account WHERE post.class= ? AND post.create_by = account.id ORDER BY `create_at` DESC';
        dbCon.query(sql, [id, id], (error, results, fields) =>{
            if(error) throw error;

            let message ="";
            if(results === undefined || results.length == 0){
                message = `Failed`;
            }else{
                message = `Success`;
            }
            return res.send ({error: false, data: results, message: message})
        })
    }
})

module.exports = discussion;