//require dependencies
let express = require('express');
let app = express();
let mysql = require('mysql');
let session = require('express-session');
const cors = require('cors');

const port = 3000;

var corsOptions = {
    origin: 'http://localhost:8080',
    optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
  }

app.use(cors(corsOptions));
// const http = require('localhost'); 
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

//เรียกใช้ body parser
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// homepage route
app.get('/', (req, res) => {
    return res.send({ 
        error: false, 
        message: 'Welcome to RESTful CRUD API with NodeJS, Express, MYSQL',
        written_by: 'Bhaksiree'
    })
})

// connect to mysql database

let dbCon = mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '', 
    database: 'classi'
})
dbCon.connect();

//SIGN IN
app.post('/signIn', function(req, res) {
	let email = req.body.email;
	let password = req.body.password;
	if (email && password) {
		dbCon.query('SELECT * FROM account WHERE email = ? AND password = ?', [email, password], function(error, results, fields) {
			if (results.length > 0) {
				req.session.loggedin = 1;
				req.session.email = email;
				res.redirect('/');
			} else {
				res.send('Incorrect Username and/or Password!');
			}			
			res.end();
		});
	} else {
		res.send('Please enter Username and Password!');
		res.end();
	}
});

//SIGN UP
app.post('/signUp', (req, res) =>{
    //สร้างตัวแปรเก็บข้อมูล ซึ่งเก็บใน request body
    let firstname = req.body.firstname;
    let lastname = req.body.lastname;
    let email = req.body.email;
    let password = req.body.password;
    let role = req.body.role;
    let image = req.body.image;
    
    if (!firstname || !lastname || !email || !password) {
        return res.status(400).send({ error: true, message: "Please provide more information."});
    } else {
        dbCon.query('INSERT INTO account (firstname, lastname, email, password, role, image) VALUES(?, ?, ?, ?, ?, ?)',
         [firstname, lastname, email, password, role, image], (error, results, fields) => {
            if (error) throw error;
            return res.send({ error: false, data: results, message: "Account successfully added"})
        })
    }
})

//GET Chat
app.get('/chat', (req, res)=>{
    dbCon.query('SELECT * FROM chat_list', (error, results, fields) =>{
        if(error) throw error;
        let message = "";
        if(results === undefined || results.length == 0){
            message = "Chat is empty";
        }else{
            message = "This is chat list";
        }
        return res.send({error: false, data: results, message: message});
    })
})

//GET Home create class
app.post('/home/createClass', (req, res)=> {
    let class_code = req.body.class_code;
    let class_name = req.body.class_name;
    let class_desc = req.body.class_desc;
    let class_pic = req.body.class_pic;
    let section = req.body.section;

    if(!class_code || !class_name || !section){
        return res.status(400).send({ error: true, message: "Please provide more information."});
    }else{
        dbCon.query('INSERT INTO class (class_code, class_name, section) VALUES (?, ? ,?)', [class_code, class_name, section], (error, results, fields) =>{
            if(error) throw error;
            return res.send({error: false, message: "Class Added"});
        })
    }
})

//GET - retrieve all class member
app.get('/class/:class_code/member', (req, res) =>{
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

//GET classroom by class code
app.get('/class/:class_code', (req, res) =>{
    let class_code = req.params.class_code;
    
    if(!class_code){
        return res.status(400).send({ error: true, message: "Please provide class code"});
    }else
    {
        dbCon.query('INSERT INTO class (class_code, class_name, class_desc, class_pic, section) VALUES (?, ? ,?, ?, ?)', [class_code, class_name, class_desc, class_pic, section], (error, results, fields) =>{
            if(error) throw error;
            let message ="";
            if(results === undefined || results.length == 0){
                message = `No ${class_code} class`;
            }else{
                message = `This is ${class_code}`;
            }
            return res.send ({error: false, data: results[0], message: message})
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


// UPDATE PROFILE
app.put('/profile/editProfile', (req, res) => {
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
        return res.status(400).send({ error: true, message: 'Please provide more information'});
    } else {
        dbCon.query('UPDATE account SET firstname = ?, lastname = ?, email = ?, password = ?, role = ?, image = ?, gender = ?, phone = ? WHERE id = ?', [firstname, lastname, email, password, role, image, gender, phone, id], (error, results, fields) => {
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

// DELETE MEMBER
app.delete('/:class_code/deleteMember', (req, res) => {
    let email = req.body.email;

    if (!id || !class_code) {
        return res.status(400).send({ error: true, message: "Please provide email"});
    } else {
        dbCon.query('DELETE FROM account WHERE email = ?', [email], (error, results, fields) => {
            if (error) throw error;

            let message = "";
            if (results.affectedRows === 0) {
                message = "Member not found";
            } else {
                message = "Member successfully deleted";
            }
            return res.send({ error: false, data: results, message: message })
        })
    }
})

app.listen(port, () => {
    console.log(`Node App is running on port ${port}`);
})

module.exports = app;