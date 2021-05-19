import dbCon from "../../configs/DBConnection";
import express from "express";

let joinClass = express();

joinClass.post('/joinClass', (req, res) =>{
    let join_code = req.body.join_code;
    let class_id = req.body.class_id;
    let account_id = req.body.account_id;

        if(!join_code){
            res.status(400).send({error: true, message: "Please provide join code to enter class"})
        }else{
            // let sql= "INSERT INTO class_member (class, role_member, account) SELECT * FROM fromaccount LEFT JOIN fromclass ON fromaccount.id = fromclass.id UNION ALL SELECT * FROM fromaccount RIGHT JOIN fromclass ON fromaccount.id = fromclass.id";
            // let sql= "INSERT INTO class_member (class, role_member, account) VALUES (?, ?, ?)";
            // dbCon.query("INSERT INTO class_member (class) SELECT id FROM class WHERE join_code = ?", [join_code], (error, results, fields) =>{
            dbCon.query('INSERT INTO class_member (account, role_member, class) SELECT account.id, account.role, class.id FROM account, class WHERE class.id =? AND account.id = ?',[class_id,account_id], (error, results, fields) =>{
            // dbCon.query("INSERT INTO class_member [(account, role_member)] SELECT id, role FROM account WHERE email = 'volktgod@gmail.com'",[account_id, join_code], (error, results, fields) =>{
                if (error) throw error;
        
                return res.status(200).send({
                  error: false,
                  code: join_code,
                  data: results,
                  message: "Added member successfully"
                })
            })
        }
})

module.exports = joinClass;