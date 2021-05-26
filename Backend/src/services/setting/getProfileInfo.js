import dbCon from "../../configs/DBConnection";
import express from "express";

let getProfileInfo = express();

getProfileInfo.post('/getprofileinfo', (req, res) =>{
    let account_id =req.body.account_id;

    // console.log('email =' + account_id);

    if(!account_id){
        res.status(200).send({error: true, message: "Please provide class code and section"})
    }else{
        dbCon.query("SELECT * FROM account WHERE id = ?", [account_id], (error, results, fields) =>{
            if (error) throw error;

            console.log(results);
            
            let message = "";
            if(results === undefined || results.length == 0){
                message = `There's no id = ${account_id}`;
            }else{
                message = `Successfully`;
            }
            console.log(results)
            return res.status(200).send ({error: false, ProfileInfo: results, message: message})
        })
    }
})

module.exports = getProfileInfo;