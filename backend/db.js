const mysql = require("mysql2");

const db = mysql.createConnection({
  host: "localhost",
  user: "root", // change if you have another user
  password: "Loki@1705", // your MySQL password
  database: "SportsClubManagement", // must match your .sql file
});

db.connect((err) => {
  if (err) throw err;
  console.log("✅ Connected to MySQL Database");
});

module.exports = db;
