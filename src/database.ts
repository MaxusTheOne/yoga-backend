import mysql from 'mysql2/promise'
import * as dotenv from 'dotenv'
dotenv.config()

const dbconnect = {
    host: process.env.MYSQL_HOST as string,
    port: Number(process.env.MYSQL_PORT) as number,
    user: process.env.MYSQL_USER as string,
    database: process.env.MYSQL_DATABASE as string,
    password: process.env.MYSQL_PASSWORD as string,
}

console.log(`host:${process.env.MYSQL_HOST}`)

// if (process.env.MYSQL_CERT) {
//   dbconnect.ssl = { cs: fs.readFileSync("DigiCertGlobalRootCA.crt.pem") };
// }

const dbconfig = await mysql.createConnection(dbconnect)

export { dbconfig }
