import dbCon from "../../configs/DBConnection";
import express from "express";

let addRole = express();

addRole.post('/addrole', (req, res) => {
    console.log(req.body);
    let id = req.body.id;
    let role = req.body.role;
    
    if(!id || !role){
        res.status(200).send({error: true, message: "Please provide id and role"})
    }else{
        dbCon.query('UPDATE account SET role = ? WHERE id = ?', [role, id], (error, results, fields) =>{
            if (error) throw error;
    
            return res.status(200).send({
                error: false,
                message: "Role added"
            })
        })
    }
})

module.exports = addRole;