import dbCon from "../configs/DBConnection";
import express from "express";
import passport from "passport";

let app = express();

app.get("/profile/:id", passport.authenticate('jwt', {session: false}), (req, res) => {
    const id = req.params.id;
    if (!id) {
      return res
        .status(400)
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

  app.get('/search', (req, res) => {
    const filters = req.query;
    const filteredUsers = dbCon.filter(user => {
      let isValid = true;
      for (key in filters) {
        console.log(key, user[key], filters[key]);
        isValid = isValid && user[key] == filters[key];
      }
      return isValid;
    });
    res.send(filteredUsers);
  });

  module.exports = app;