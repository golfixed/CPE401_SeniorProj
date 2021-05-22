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
const cors = require('cors');
const path = require('path');

let app = express();

//CORS
var corsOptions = {
    origin: "http://localhost:8080",
    optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};

app.use(cors(corsOptions));

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
app.post("/uploadProfile", upload.single('image'), (req, res) => {
    let email = req.body.email;
    let image  = `http://localhost:3000/profile/${req.file.filename}`;

    if(!email){
        res.status(400).send({error: true, message: 'Please give your EMAIL to upload your profile picture'});
    }else{
        dbCon.query("UPDATE account SET image = ? WHERE email = ?", [image, email], (error, results, fields) => {
            if (error) throw error;
    
            res.status(200).send({
                error: false,
                account: email,
                profile_url: image 
            })
        })
        console.log(image);
    }
})

app.use('/classPic', express.static('upload/images'));
app.post("/uploadClassProfile", upload.single('image'), (req, res) => {
    let class_id = req.body.class_id;
    let image  = `http://localhost:3000/classPic/${req.file.filename}`;

    if(!class_id){
        res.status(400).send({error: true, message: 'Please give CLASS ID to upload your profile picture'});
    }else{
        dbCon.query("UPDATE class SET class_pic = ? WHERE id = ?", [image, class_id], (error, results, fields) => {
            if (error) throw error;
    
            res.status(200).send({
                error: false,
                class_id: class_id,
                profile_url: image 
            })
        })
        console.log(image);
    }
})

app.use('/postPic', express.static('upload/images'));
app.post("/uploadPostPic", upload.single('image'), (req, res) => {
    let post_id = req.body.id;
    let image  = `http://localhost:3000/postPic/${req.file.filename}`;

    if(!post_id){
        res.status(400).send({error: true, message: 'Please give POST ID to upload your picture'});
    }else{
        dbCon.query("UPDATE post SET pic_url = ? WHERE id = ?", [image, post_id], (error, results, fields) => {
            if (error) throw error;
    
            res.status(200).send({
                error: false,
                post_id: post_id,
                profile_url: image 
            })
        })
        console.log(image);
    }
})

app.use('/commentPic', express.static('upload/images'));
app.post("/uploadCommentPic", upload.single('image'), (req, res) => {
    let comment_id = req.body.id;
    let image  = `http://localhost:3000/commentPic/${req.file.filename}`;

    if(!comment_id){
        res.status(400).send({error: true, message: 'Please give COMMENT ID to upload your picture'});
    }else{
        dbCon.query("UPDATE comment SET pic_url = ? WHERE id = ?", [image, comment_id], (error, results, fields) => {
            if (error) throw error;
    
            res.status(200).send({
                error: false,
                comment_id: comment_id,
                profile_url: image 
            })
        })
        console.log(image);
    }
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
