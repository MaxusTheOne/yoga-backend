import { Router } from "express";
import { dbconfig } from "../database.js";
const eventRouter = Router();
eventRouter.get("/search", async (request, response) => {
    const page = request.query.page || 1;
    const eventsPerPage = request.query.eventsPerPage || 501;
    const sql = `CALL getPage(?, ?)`;
    const values = [page, eventsPerPage];
    console.log(values);
    const [results] = await dbconfig.execute(sql, values);
    response.json(results);
});
eventRouter.get("/", async (request, response) => {
    const page = request.query.page || 1;
    const eventsPerPage = request.query.eventsPerPage || 501;
    const search = request.query.titleSearch || "";
    const sql = `CALL getPage(?, ?, ?)`;
    const values = [page, eventsPerPage, search];
    console.log(values);
    const [results] = await dbconfig.execute(sql, values);
    response.json(results);
});
eventRouter.post("/", async (request, response) => {
    const title = request.body.title;
    const description = request.body.description || "";
    const start = request.body.start;
    const end = request.body.end;
    const sql = `CALL postEvent(?, ?, ?, ?)`;
    const values = [title, description, start, end];
    console.log(values);
    const [results] = await dbconfig.execute(sql, values);
    response.send(results);
});
export default eventRouter;
//# sourceMappingURL=events.js.map