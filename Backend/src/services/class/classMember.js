import dbCon from "../../configs/DBConnection";
import express from "express";

let classMember = express();

classMember.get("/:class_code/classMember", (req, res) =>{
    const class_code = req.params.class_code;
    
    let classMembers = {
        account: req.body.account,
        class: req.body.class,
        role_member: req.body.role_member
    }

    if(class_code.id == classMembers.class){
        dbCon.query('SELECT * FROM class_member WHERE class = ?', [classMembers.class], (error, results, fields) =>{
            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `There's no members in ${class_code} class`;
            }else{
                message = `Request members in ${class_code} class successfully`;
            }
            return res.send ({error: false, data: results[0], message: message})
        })
        console.log("Theres members in this class")
    }else{
        console.log("NO MEMBER")
    }
    


})

module.exports = classMember;
