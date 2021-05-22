import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let classList = express();

classList.get('/classrooms', (req, res) =>{

    dbCon.query('SELECT * FROM class',(error, results, fields) =>{
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