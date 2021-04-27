require('dotenv').config();
import express from "express";
import configViewEngine from "./configs/viewEngine";
import initWebRoutes from "./routes/web";
import bodyParser from "body-parser";
import cookieParser from 'cookie-parser';
import session from "express-session";
import connectFlash from "connect-flash";
import passport from "passport";
import dbCon from "./configs/DBConnection";

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

const requireJWTAuth = passport.authenticate('jwt', {session: false});

app.get("/profile/:id", requireJWTAuth, (req, res) => {
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

// Enable body parser post data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//Config view engine
configViewEngine(app);

//Enable flash message
app.use(connectFlash());

//Config passport middleware
app.use(passport.initialize());
app.use(passport.session());

// init all web routes
initWebRoutes(app);

let port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Building a login system with NodeJS is running on port ${port}!`));
