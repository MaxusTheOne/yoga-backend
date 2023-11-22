import { Router } from "express";
import { dbconfig } from "../database.js";

const eventRouter = Router()

// //gets all events
// eventRouter.get("/", async (request, response) =>{
//     const sql = `CALL getEvents()`
//     console.log(request.body);
    

//     const [results] = await dbconfig.execute(sql);

//     response.json(results)
// })

// gets events by title,
eventRouter.get("/search", async (request, response) =>{
    const page = request.query.page || 1
    const eventsPerPage = request.query.eventsPerPage || 501
    const sql = `CALL getPage(?, ?)`
    const values = [page, eventsPerPage]
    console.log(values);
    

    const [results] = await dbconfig.execute(sql, values);

    response.json(results)
})


// gets page x of events with y events per page,optional queries: page:int, eventsPerPage:int, titleSearch:string
eventRouter.get("/", async (request, response) =>{
    const page = request.query.page || 1
    const eventsPerPage = request.query.eventsPerPage || 501
    const search = request.query.titleSearch || ""
    const sql = `CALL getPage(?, ?, ?)`
    const values = [page, eventsPerPage, search]
    console.log(values);
    

    const [results] = await dbconfig.execute(sql, values);

    response.json(results)
})

// posts an event with syntax {title: string , description?: string, start: stringDate, end: stringDate}
// example = {title:"Cool event", description:"no", start:"2023-04-23 02:00:00", end:"2023-04-23 06:00:00"}

eventRouter.post("/", async (request, response) =>{
    const title = request.body.title
    const description = request.body.description || ""
    const start = request.body.start
    const end = request.body.end
    const sql = `CALL postEvent(?, ?, ?, ?)`
    const values = [title,description,start,end]
    console.log(values);
    

    const [results] = await dbconfig.execute(sql, values);

    response.send(results)
})


export default eventRouter