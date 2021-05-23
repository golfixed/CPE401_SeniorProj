import DBConnection from "./../configs/DBConnection";
import bcrypt from "bcryptjs";

let createNewUser = (data) => {
    return new Promise(async (resolve, reject) => {
        // check email is exist or not
        let isEmailExist = await checkExistEmail(data.email);
        if (isEmailExist) {
            reject(`${data.email} has already exist. Please choose an other email`);
            console.log('email ALREADY EXIST');
        } else {
            console.log('email NOT EXIST');
            // hash password
            let salt = bcrypt.genSaltSync(10);
            let userItem = {
                firstname: data.firstname,
                lastname: data.lastname,
                email: data.email,
                password: bcrypt.hashSync(data.password, salt)
            };

            console.log('Account CREATED');
            //create a new account
            DBConnection.query(
                ' INSERT INTO account SET ? ', userItem,
                function(err, rows) {
                    console.log('DB INSERT NEW USER ITEM');
                    if (err) {
                        reject(false)
                        console.log('found error: ' + err);
                    }
                    resolve("Create a new user successful");
                }
            );
        }
    });
};

let checkExistEmail = (email) => {
    return new Promise( (resolve, reject) => {
        try {
            DBConnection.query(
                ' SELECT * FROM account WHERE email = ?  ', email,
                function(err, rows) {
                    if (err) {
                        reject(err)
                    }
                    if (rows.length > 0) {
                        resolve(true)
                    } else {
                        resolve(false)
                    }
                }
            );
        } catch (err) {
            reject(err);
        }
    });
};
module.exports = {
    createNewUser: createNewUser
};
