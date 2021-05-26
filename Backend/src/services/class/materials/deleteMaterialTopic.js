import dbCon from "../../../configs/DBConnection";
import express from "express";

let delmaterialtopic = express();

delmaterialtopic.delete('/deletematerialtopic', (req, res) => {
    //material topic id
    let id = req.body.id;

    if (!id) {
        res.status(200).send({ error: true, message: "Please provide material topic id" })
    } else {
        dbCon.query('SELECT * FROM material_topic WHERE id = ?', [id], (error, results) => {
            if (error) { console.log(error) }
            else {
                if (results.length > 0) {
                    let mat_id = results[0].id;
                    console.log('result id from mat topic ' + mat_id)
                    //CHECK IS COMMENT EXIST
                    dbCon.query('SELECT material_topic FROM material WHERE material_topic = ?', mat_id, (error, results) =>{
                        if (error) throw error;

                        if(results.length > 0){
                            //DELETE COMMENT IF THERE IS COMMENT EXIST
                            dbCon.query("DELETE FROM material WHERE material_topic = ?", mat_id, (error, results, fields) => {
                                if (error) throw error;
        
                                console.log(results)
                                if (results.affectedRows > 0) {
                                    // message = `Delete comment id = ${id} successfully`;
                                    
                                    dbCon.query("DELETE FROM material_topic WHERE id = ?", mat_id, (error, results, fields) => {
                                        if (error) throw error;
                                        console.log('del mat' + results)
                                        let message = "";
                                        if (results.affectedRows === 0) {
                                            message = `There's no mat id = ${id} `;
                                        } else {
                                            message = `Delete topic and mat successfully`;
                                        }
                                        return res.status(200).send({ error: false, data: results[0], message: message })
                                    })
                                    
                                } else {
                                    return res.status(200).send({ error: false, data: results[0], message: "Delete failed" })
                                }
                            })

                        }else{
                            dbCon.query("DELETE FROM material_topic WHERE id = ?", mat_id, (error, results, fields) => {
                                if (error) throw error;
                                console.log('del mat topic' + results)
                                let message = "";
                                if (results.affectedRows === 0) {
                                    message = `There's no mat topic id = ${id} `;
                                } else {
                                    message = `Delete mat topic id = ${id} successfully`;
                                }
                                return res.status(200).send({ error: false, data: results[0], message: message })
                            })
                                                        
                        }
                    })

                } else {
                    res.status(200).send({ error: true, message: "No material topic id in DB" })
                }
            }
        })
    }
})


module.exports = delmaterialtopic;