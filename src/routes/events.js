import { Router } from "express";
import { dbconfig } from "../database.js";

const eventRouter = Router()

eventRouter.get("/", async (request, response) =>{
    const sql = `CALL getEvents()`
    console.log(request.body);
    

    const [results] = await dbconfig.execute(sql);

    response.json(results)
})

export default eventRouter