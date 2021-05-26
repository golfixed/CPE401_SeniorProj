import dbCon from "../../configs/DBConnection";
import express from "express";

let getclassid = express();

getclassid.post('/getclassid', (req, res) => {
    let join_code = req.body.join_code;

    console.log('joincode =' + join_code);

    if (!join_code) {
        res.status(200).send({ error: true, message: "Please provide join code" })
    } else {
        dbCon.query("SELECT id FROM class WHERE join_code = ?", [join_code], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            let err = false;
            if (results === undefined || results.length == 0) {
                message = `Join class doesnt exist `;
                err = true;
            } else {
                message = `Successfully`;
                err = false;
            }
            console.log(results)
            return res.status(200).send({ error: err, classInfo: results[0], message: message })
        })
    }
})

module.exports = getclassid;