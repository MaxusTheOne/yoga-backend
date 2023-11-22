import mysql from "mysql2/promise";
import * as dotenv from 'dotenv';
dotenv.config()
// import fs from "fs";

const dbconnect = {
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USER,
  database: process.env.MYSQL_DATABASE,
  password: process.env.MYSQL_PASSWORD,
};

console.log(`host:${process.env.MYSQL_HOST}`);


// if (process.env.MYSQL_CERT) {
//   dbconnect.ssl = { cs: fs.readFileSync("DigiCertGlobalRootCA.crt.pem") };
// }

const dbconfig = await  mysql.createConnection(dbconnect);

export { dbconfig };