//require dependencies
let express = require('express');
let app = express();
let bodyParser = require('body-parser');
let mysql = require('mysql');

//เรียกใช้ body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// homepage route
app.get('/', (req, res) => {
    return res.send({ 
        error: false, 
        message: 'Welcome to RESTful CRUD API with NodeJS, Express, MYSQL',
        written_by: 'Bhaksiree',
        published_on: 'https://milerdev.dev'
    })
})

app.listen(3000, () => {
    console.log('Node App is running on port 3000');
})

module.exports = app;