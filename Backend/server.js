//require dependencies
let express = require("express");
let app = express();
let mysql = require("mysql");
const cors = require("cors");

const port = 3000;

var corsOptions = {
  origin: "*",
  optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};

app.use(cors(corsOptions));
// const http = require('localhost');

app.listen(3000);

//เรียกใช้ body parser
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// homepage route
app.get("/", (req, res) => {
  return res.send({
    error: false,
    message: "Welcome to RESTful CRUD API with NodeJS, Express, MYSQL",
    written_by: "Bhaksiree",
    test: "this is GOLF",
  });
});

app.get("/new", (req, res) => {
  return res.send({ test: "GOLF" });
});

//connect to mysql database
// let dbCon = mysql.createConnection({
//     host:'localhost',
//     user: 'root',
//     password: '',
//     database: 'classi'
// })
// dbCon.connect();

//GET - retrieve all class member
app.get("/:class_code/member", (req, res) => {
  dbCon.query("SELECT * FROM class_member", (error, results, fields) => {
    if (error) throw error;
    //check ว่ามีข้อมูลหรือไม่
    let message = "";
    if (results === undefined || results.length == 0) {
      message = "No member";
    } else {
      message = "Successfully retrieved all account";
    }
    return res.send({ error: false, data: results, message: message });
  });
});

//SIGN UP
app.post("/signUp", (req, res) => {
  //สร้างตัวแปรเก็บข้อมูล ซึ่งเก็บใน request body
  let firstname = req.body.firstname;
  let lastname = req.body.lastname;
  let email = req.body.email;
  let password = req.body.password;
  let role = req.body.role;
  let image = req.body.image;

  if (!firstname || !lastname || !email || !password) {
    return res
      .status(400)
      .send({ error: true, message: "Please provide more information." });
  } else {
    dbCon.query(
      "INSERT INTO account (firstname, lastname, email, password, role, image) VALUES(?, ?, ?, ?, ?, ?)",
      [firstname, lastname, email, password, role, image],
      (error, results, fields) => {
        if (error) throw error;
        return res.send({
          error: false,
          data: results,
          message: "Account successfully added",
        });
      }
    );
  }
});

//GET classroom by class code
app.get("/:class_code", (req, res) => {
  let classCode = req.params.class_code;
  if (!class_code) {
    return res
      .status(400)
      .send({ error: true, message: "Please provide class code" });
  }
});

//GET profile
app.get("/profile/:id", (req, res) => {
  let id = req.params.id;
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

// UPDATE PROFILE
app.put("/profile/editProfile", (req, res) => {
  let id = req.body.id;
  let firstname = req.body.firstname;
  let lastname = req.body.lastname;
  let email = req.body.email;
  let password = req.body.password;
  let role = req.body.role;
  let image = req.body.image;
  let gender = req.body.gender;
  let phone = req.body.phone;

  // validation
  // if (!id || !firstname || !lastname || !email || !password || !role || !image || !gender || !phone) {
  if (!id || !firstname || !lastname || !email || !password) {
    return res
      .status(400)
      .send({ error: true, message: "Please provide more information" });
  } else {
    dbCon.query(
      "UPDATE account SET firstname = ?, lastname = ?, email = ?, password = ?, role = ?, image = ?, gender = ?, phone = ? WHERE id = ?",
      [firstname, lastname, email, password, role, image, gender, phone, id],
      (error, results, fields) => {
        if (error) throw error;

        let message = "";
        if (results.changedRows === 0) {
          message = "ID not found or data are same";
        } else {
          message = "ID information successfully updated";
        }

        return res.send({ error: false, data: results, message: message });
      }
    );
  }
});

// DELETE MEMBER
app.delete("/:class_code/deleteMember", (req, res) => {
  let email = req.body.email;

  if (!id || !class_code) {
    return res
      .status(400)
      .send({ error: true, message: "Please provide email" });
  } else {
    dbCon.query(
      "DELETE FROM account WHERE email = ?",
      [email],
      (error, results, fields) => {
        if (error) throw error;

        let message = "";
        if (results.affectedRows === 0) {
          message = "Member not found";
        } else {
          message = "Member successfully deleted";
        }

        return res.send({ error: false, data: results, message: message });
      }
    );
  }
});

app.listen(port, () => {
  console.log(`Node App is running on port ${port}`);
});

module.exports = app;
