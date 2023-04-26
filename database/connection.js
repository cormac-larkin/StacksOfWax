/**
 * This file exports a connection to the MySQL database.
 */

const mysql = require("mysql");

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "40361594",
    port: "3306",
    multipleStatements: true
});

db.connect((err) => {
  if (err) throw err;
  console.log("*** Database connected successfully ***");
});

module.exports = db;