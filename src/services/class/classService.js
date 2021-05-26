import DBConnection from "../../configs/DBConnection";

let createNewClass = (data) => {
    return new Promise(async (resolve, reject) => {
        // check email is exist or not
        // let isClassExist = await checkExistClass(data.class_code, data.section);
        // if (isClassExist) {
        //     reject(`This class "${data.id}" has already exist. Please choose an other class`);
        // } else {
            
            function joinCode(length) {
                var result           = [];
                var characters       = 'abcdefghijklmnopqrstuvwxyz0123456789';
                var charactersLength = characters.length;
                for ( var i = 0; i < length; i++ ) {
                  result.push(characters.charAt(Math.floor(Math.random() * 
             charactersLength)));
               }
               return result.join('');
            }

            let classObject = {
                class_code: data.class_code,
                class_name: data.class_name,
                class_desc: data.class_desc,
                join_code: joinCode(6),
                section: data.section,
                create_by: data.create_by
            };
        
            console.log(classObject.join_code);

            //create a new account
            DBConnection.query(
                ' INSERT INTO class SET ? ', classObject,
                function(err, rows) {
                    console.log('db err: ' + err)
                    if (err) {
                        reject(false)
                    }
                    resolve("Create a new class successful");
                }
            );

        // }
    });
};

// let checkExistClass = (class_code, section) => {
//     // console.log('check class exist');
//     return new Promise( (resolve, reject) => {
//         try {
//             DBConnection.query(
//                 ' SELECT * FROM `class` WHERE `class_code` = ? AND `section` = ? ', [class_code, section],
//                 function(err, rows) {
//                     // console.log('error:' + err);
//                     // console.log('rows:' + rows);
//                     if (err) { 
//                         reject(err)
//                     }
//                     if (rows.length > 0) {
//                         resolve(true)
//                     } else {
//                         resolve(false)
//                     }
//                 }
//             );
//         } catch (err) {
//             reject(err);
//         }
//     });
// };


module.exports = {
    createNewClass: createNewClass
};
