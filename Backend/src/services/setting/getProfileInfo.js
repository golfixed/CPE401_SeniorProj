import dbCon from "../../configs/DBConnection";
import express from "express";

let getProfileInfo = express();

getProfileInfo.post('/api/getprofileinfo', (req, res) =>{
    let email =req.body.email;

    console.log('email =' + email);

    if(!email){
        res.status(200).send({error: true, message: "Please provide class code and section"})
    }else{
        dbCon.query("SELECT * FROM account WHERE email = ?", [email], (error, results, fields) =>{
            if (error) throw error;
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no email = ${email}`;
            }else{
                message = `Successfully`;
            }
            console.log(results)
            return res.status(200).send ({error: false, ProfileInfo: results, message: message})
        })
    }
})

module.exports = getProfileInfo;