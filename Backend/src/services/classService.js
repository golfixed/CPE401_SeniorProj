import DBConnection from "./../configs/DBConnection";

let createNewClass = (data) => {
    return new Promise(async (resolve, reject) => {
        // check email is exist or not
        let isClassExist = await checkExistClass(data.class_code, data.section);
        if (isClassExist) {
            reject(`This class "${data.id}" has already exist. Please choose an other class`);
        } else {
            
            let classObject = {
                class_code: data.class_code,
                class_name: data.class_name,
                class_desc: data.class_desc,
                class_pic: data.class_pic,
                section: data.section
            };

            //create a new account
            DBConnection.query(
                ' INSERT INTO class SET ? ', classObject,
                function(err, rows) {
                    if (err) {
                        reject(false)
                    }
                    resolve("Create a new class successful");
                }
            );
        }
    });
};

let checkExistClass = (class_code, section) => {
    return new Promise( (resolve, reject) => {
        try {
            DBConnection.query(
                ' SELECT * FROM `class` WHERE `class_code` = ? AND `section` = ? ', [class_code, section],
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
    createNewClass: createNewClass
};
