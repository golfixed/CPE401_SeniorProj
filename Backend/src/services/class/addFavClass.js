import dbCon from "../../configs/DBConnection";
import express from "express";
//check exist class

let addFavClass = express();

//
addFavClass.post('/addfav', (req, res) =>{
    let id = req.body.id;
    let fav = req.body.fav;

    if(!id){
        return res.status(400).send({ error: true, message: "Please provide class id"});
    }else
    {
        // dbCon.query('SELECT * FROM class WHERE id = ?', [id], (error, results, fields) =>{
        dbCon.query('UPDATE class SET favorite = ? WHERE id = ?', [fav, id], (error, results, fields) =>{
            if(error) throw error;

            let message ="";
            if(results === undefined || results.length == 0){
                message = `There's no class id = ${id}`;
            }else{
                message = `Set add favorite successgully`;
            }
            return res.send ({error: false, data: results[0], message: message})
        })
    }
})

module.exports = addFavClass;