import dbCon from "../../configs/DBConnection";
import express from "express";

let joinClass = express();

joinClass.post('/joinclass', (req, res) => {
    let join_code = req.body.join_code;
    let account_id = req.body.account_id;

    if (!join_code) {
        res.status(200).send({ error: true, message: "Please provide join code to enter class" })
    } else {
        //query join_code is in database
        dbCon.query('SELECT id FROM class WHERE join_code = ?', [join_code], (error, results) => {
            if(error) {console.log(error)}
            else {
                console.log(results)
                if (results.length > 0) {
                    var class_id = results[0].id;

                    dbCon.query('SELECT id FROM class_member WHERE account = ? AND class = ?',[account_id,class_id],(error,results) => {
                        if(error) {console.log(error)}
                        else {
                            console.log(results)
                            if(results.length > 0){
                                res.status(200).send({ error: true, message: "You are already in class" })
                            }
                            else {
                            dbCon.query('INSERT INTO class_member (account, class) SELECT account.id, class.id FROM account, class WHERE join_code =? AND account.id = ?', [join_code, account_id], (error, results, fields) => {
                                if (error) throw error;
            
                                return res.status(200).send({
                                    error: false,
                                    class_id: class_id,
                                    message: "Added member successfully"
                                })
                            })
                            }
                        }  
                    })
                }
                else {
                    console.log('NO RESULT')
                    res.status(200).send({ error: true, message: "No classroom found for code: " + join_code})
    
    
                    
                }
            }
        })
    }
})

module.exports = joinClass;