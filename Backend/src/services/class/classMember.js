import dbCon from "../../configs/DBConnection";
import express from "express";

let classMember = express();

classMember.get("/classMember/:class_code/:section", (req, res) =>{
    
    let classMembers = {
        class: req.params.class_code,
        section: req.params.section,
        account: req.body.account,        
        class_code: req.body.class_code,
        role_member: req.body.role_member
    }

    if(classMembers.class){
        dbCon.query('SELECT class_member.class, class_member.role_member, class.class_code, class.section, account.firstname,account.lastname FROM class_member,class,account WHERE class_member.class=class.id AND class_member.account=account.id AND class.class_code= ? AND class.section = ?', [classMembers.class, classMembers.section], (error, results, fields) =>{

            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `There's no members in class id =${classMembers.class} section ${classMembers.section}`;
            }else{
                message = `Request members in  class id = ${classMembers.class} section ${classMembers.section} successfully`;
            }
            console.log(message);
            return res.status(200).send ({error: false, data: results, message: message})
        })
    }else{
        console.log("NO MEMBER")
    }  
})

module.exports = classMember;
