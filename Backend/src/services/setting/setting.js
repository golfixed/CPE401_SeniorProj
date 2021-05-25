import dbCon from "../../configs/DBConnection";
import express from "express";

let setting = express();

//get setting page by using ID
setting.get("/setting/:id", (req, res) => {
    const id = req.params.id;
    if (!id) {
      return res
        .status(200)
        .send({ error: true, message: "Please provide account id" });
    } else {
      dbCon.query(
        "SELECT * FROM account WHERE id = ?",
        id,
        (error, results, fields) => {
          if (error) throw error;
  
          let message = "";
          if (results === undefined || results.length == 0) {
            message = "ID not found";
          } else {
            message = `Successfully retrieved profile ID = ${id}`;
          }
          return res.send({ error: false, data: results[0], message: message });
        }
      );
    }
  });


  module.exports = setting;