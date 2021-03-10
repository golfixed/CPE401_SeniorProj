//require dependencies
let express = require('express');
let app = express();
let bodyParser = require('body-parser');
let mysql = require('mysql');

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

app.listen(3000, () => {
    console.log('Node App is running on port 3000');
})

module.exports = app;