import dbCon from "../../configs/DBConnection";
import express from "express";

let classMember = express();

classMember.post("/classmember", (req, res) =>{
    
    let class_id = req.params.class_id;
    
    if(!class_id){
        return res.status(200).send({ error: true, message: "Please provide class id"});
    }else{
        dbCon.query('SELECT class_member.id, account.firstname,account.lastname, account.image, account.role FROM class_member,class,account WHERE class_member.class=class.id AND class_member.account=account.id AND class.id= ?', [class_id], (error, results, fields) =>{

            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `There's no members in class id = ${class_id}`;
            }else{
                message = `Request members in  class id = ${class_id} successfully`;
            }
            console.log(message);
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }
})

module.exports = classMember;
