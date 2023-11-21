"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.dbconfig = void 0;
const promise_1 = __importDefault(require("mysql2/promise"));
require("dotenv/config");
const dbconnect = {
    host: process.env.MYSQL_HOST,
    port: Number(process.env.MYSQL_PORT),
    user: process.env.MYSQL_USER,
    database: process.env.MYSQL_DATABASE,
    password: process.env.MYSQL_PASSWORD,
};
const dbconfig = promise_1.default.createConnection(dbconnect);
exports.dbconfig = dbconfig;
//# sourceMappingURL=database.js.map