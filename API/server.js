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
    database: 'class'
})
dbCon.connect();

//GET - retrieve all account
app.get('/account', (req, res) =>{
    dbCon.query('SELECT * FROM account', (error, results, fields) =>{
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

//POST - add member to account
app.post('/account', (req, res) =>{
    //สร้างตัวแปรเก็บข้อมูล ซึ่งเก็บใน request body
    let username = req.body.username;
    let email = req.body.email;
    let password = req.body.password;
    let role = req.body.role;
    let gender = req.body.gender;
    let phone = req.body.phone;

    // validation
    if (!username || !email || !password || !role || !gender || !phone) {
        return res.status(400).send({ error: true, message: "Please provide more information."});
    } else {
        dbCon.query('INSERT INTO account (username, email, password, role, gender, phone ) VALUES(?, ?, ?, ?, ?, ?)', [username, email, password, role, gender, phone], (error, results, fields) => {
            if (error) throw error;
            return res.send({ error: false, data: results, message: "Member successfully added"})
        })
    }
});

// retrieve account by id 
app.get('/account/:id', (req, res) => {
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
                message = "Successfully retrieved ID data";
            }

            return res.send({ error: false, data: results[0], message: message })
        })
    }
})

// update book with id 
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
        return res.status(400).send({ error: true, message: "Please provide book id"});
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