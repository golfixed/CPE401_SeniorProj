//require dependencies
let express = require('express');
let app = express();
let bodyParser = require('body-parser');
let mysql = require('mysql');

const port = 3000;

// const http = require('http');


//เรียกใช้ body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// homepage route
app.get('/', (req, res) => {
    return res.send({ 
        error: false, 
        message: 'Welcome to RESTful CRUD API with NodeJS, Express, MYSQL',
        written_by: 'Bhaksiree'
    })
})

//connect to mysql database
let dbCon = mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '', 
    database: 'classi'
})
dbCon.connect();

//GET - retrieve all account
app.get('/class/member', (req, res) =>{
    dbCon.query('SELECT * FROM class_member', (error, results, fields) =>{
        if(error) throw error;
        //check ว่ามีข้อมูลหรือไม่
        let message = "";
        if(results === undefined || results.length == 0){
            message = "No member";
        }else{
            message = "Successfully retrieved all account";
        }
        return res.send({error: false, data: results, message: message});
    })
})

//SIGN UP
app.post('/signup', (req, res) =>{
    //สร้างตัวแปรเก็บข้อมูล ซึ่งเก็บใน request body
    let firstname = req.body.firstname;
    let lastname = req.body.lastname;
    let email = req.body.email;
    let password = req.body.password;
    let role = req.body.role;
    let image = req.body.image;
    // let gender = req.body.gender;
    // let phone = req.body.phone;

    // validation
    // if (!username || !email || !password || !role || !gender || !phone) {
    if (!firstname || !lastname || !email || !password || !role) {
        return res.status(400).send({ error: true, message: "Please provide more information."});
    } else {
        // dbCon.query('INSERT INTO account (username, email, password, role, gender, phone ) VALUES(?, ?, ?, ?, ?, ?)', [username, email, password, role, gender, phone], (error, results, fields) => {
        dbCon.query('INSERT INTO account (firstname, lastname, email, password, role, image) VALUES(?, ?, ?, ?, ?, ?)', [firstname, lastname, email, password, role, image], (error, results, fields) => {
            if (error) throw error;
            return res.send({ error: false, data: results, message: "Member successfully added"})
        })
    }
})


//GET profile
app.get('/profile/:id', (req, res) => {
    let id = req.params.id;
    if (!id) {
        return res.status(400).send({ error: true, message: "Please provide account id"});
    } else {
        dbCon.query("SELECT * FROM account WHERE id = ?", id, (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results === undefined || results.length == 0) {
                message = "ID not found";
            } else {
                message = `Successfully retrieved profile ID = ${id}`;
            }
            return res.send({ error: false, data: results[0], message: message })
        })
    }
})

// update account with id 
app.put('/account', (req, res) => {
    let id = req.body.id;
    let username = req.body.username;
    let email = req.body.email;
    let password = req.body.password;
    let role = req.body.role;
    let gender = req.body.gender;
    let phone = req.body.phone;

    // validation
    if (!id || !username || !email || !password || !role || !gender || !phone) {
        return res.status(400).send({ error: true, message: 'Please provide more information'});
    } else {
        dbCon.query('UPDATE account SET username = ?, email = ?, password = ?, role = ?, gender = ?, phone = ? WHERE id = ?', [username, email, password, role, gender, phone, id], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.changedRows === 0) {
                message = "ID not found or data are same";
            } else {
                message = "ID information successfully updated";
            }

            return res.send({ error: false, data: results, message: message })
        })
    }
})

// delete account by id
app.delete('/account', (req, res) => {
    let id = req.body.id;

    if (!id) {
        return res.status(400).send({ error: true, message: "Please provide account id"});
    } else {
        dbCon.query('DELETE FROM account WHERE id = ?', [id], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "ID not found";
            } else {
                message = "ID successfully deleted";
            }

            return res.send({ error: false, data: results, message: message })
        })
    }
})


app.listen(port, () => {
    console.log(`Node App is running on port ${port}`);
})

module.exports = app;