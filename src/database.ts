import mysql from "mysql2/promise";
import "dotenv/config";
// import fs from "fs";

const dbconnect = {
  host: process.env.MYSQL_HOST as string,
  port: Number(process.env.MYSQL_PORT) as number,
  user: process.env.MYSQL_USER as string,
  database: process.env.MYSQL_DATABASE as string,
  password: process.env.MYSQL_PASSWORD as string,
};

// if (process.env.MYSQL_CERT) {
//   dbconnect.ssl = { cs: fs.readFileSync("DigiCertGlobalRootCA.crt.pem") };
// }

const dbconfig =  mysql.createConnection(dbconnect);

export { dbconfig };