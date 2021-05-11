require('dotenv').config();
import express from "express";
import initWebRoutes from "./routes/web";
import bodyParser from "body-parser";
import cookieParser from 'cookie-parser';
import session from "express-session";
import connectFlash from "connect-flash";
import passport from "passport";
import multer from "multer";
import dbCon from "./configs/DBConnection";
const path = require('path');

let app = express();
//use cookie parser
app.use(cookieParser('secret'));

//config session
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24 // 86400000 1 day
    }
}));

// Enable body parser post data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


//Enable flash message
app.use(connectFlash());

//Config passport middleware
app.use(passport.initialize());
app.use(passport.session());

const storage = multer.diskStorage({
    destination: './upload/images',
    filename: (req, file, cb) => {
        return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`)
    }
})

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024*1024*10
    }
})
app.use('/profile', express.static('upload/images'));
app.post("/upload", upload.single('image'), (req, res) => {
    let email = req.body.email;
    var image  = `http://localhost:3000/profile/${req.file.filename}`;
    // let image = req.body.image;

    dbCon.query("UPDATE account SET image = ? WHERE email = ?", [image, email], (error, results, fields) => {
        if (error) throw error;

        res.status(200).send({
            success: 1,
            profile_url: image 
        })
    })
    console.log(image);
})

function errHandler(err, req, res, next) {
    if (err instanceof multer.MulterError) {
        res.json({
            success: 0,
            message: err.message
        })
    }
}
app.use(errHandler);


// init all web routes
initWebRoutes(app);

let port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Building a login system with NodeJS is running on port ${port}!`));
