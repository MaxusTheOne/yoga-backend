import mysql from "mysql2/promise";
import * as dotenv from 'dotenv';
dotenv.config();
const dbconnect = {
    host: process.env.MYSQL_HOST,
    port: Number(process.env.MYSQL_PORT),
    user: process.env.MYSQL_USER,
    database: process.env.MYSQL_DATABASE,
    password: process.env.MYSQL_PASSWORD,
};
console.log(`host:${process.env.MYSQL_HOST}`);
const dbconfig = await mysql.createConnection(dbconnect);
export { dbconfig };
//# sourceMappingURL=database.js.map