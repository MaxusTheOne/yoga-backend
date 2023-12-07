import mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';
import fs from 'fs';
dotenv.config();
const dbconnect = {
    host: process.env.MYSQL_HOST,
    port: Number(process.env.MYSQL_PORT),
    user: process.env.MYSQL_USER,
    database: process.env.MYSQL_DATABASE,
    password: process.env.MYSQL_PASSWORD,
};
console.log(`host:${process.env.MYSQL_HOST}`);
const filePath = 'DigiCertGlobalRootCA.crt.pem';
const fileContent = fs.readFileSync(filePath, 'utf8');
console.log(fileContent);
if (process.env.MYSQL_CERT) {
    dbconnect.ssl = {
        cs: fs.readFileSync('DigiCertGlobalRootCA.crt.pem'),
    };
}
const dbconfig = await mysql.createConnection(dbconnect);
export { dbconfig };
//# sourceMappingURL=database.js.map