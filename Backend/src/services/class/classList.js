import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classList = express();

classList.post('/classrooms', (req, res) =>{
    console.log('req id: ' +req.body.id)
    let id = req.body.id;

    dbCon.query('SELECT class.class_code,class.class_name,class.section,account.firstname,account.lastname,account.image FROM class_member,class,account WHERE class_member.class=class.id AND class_member.account=account.id AND account.id= ?',[id],(error, results, fields) =>{
        if(error) throw error;
        
        let message ="";
        if(results === undefined || results.length == 0){
            message = `Failed `;
        }else{
            message = `All class list`;
        }
        return res.send ({error: false, data: results, message: message})
    })
})

module.exports = classList;