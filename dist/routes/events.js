import { Router } from 'express';
import { dbconfig } from '../database.js';
const eventRouter = Router();
eventRouter.get('/search', async (request, response) => {
    const page = request.query.page || 1;
    const eventsPerPage = request.query.eventsPerPage || 501;
    const sql = `CALL getEventPage(?, ?)`;
    const values = [page, eventsPerPage];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
eventRouter.get('/signups', async (request, response) => {
    const sql = 'SELECT * FROM users_events';
    console.log(request.body);
    try {
        const [results] = await dbconfig.execute(sql);
        response.status(200).json(results);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
eventRouter.get('/', async (request, response) => {
    const page = request.query.page || 1;
    const eventsPerPage = request.query.eventsPerPage || 501;
    const search = request.query.titleSearch || '';
    const sql = `CALL getEventPage(?, ?, ?)`;
    const values = [page, eventsPerPage, search];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
eventRouter.post('/', async (request, response) => {
    const title = request.body.title;
    const description = request.body.description || '';
    const start = request.body.start;
    const end = request.body.end;
    const imageUrl = request.body.imageUrl;
    const linkUrl = request.body.linkUrl;
    const sql = `CALL postEvent(?, ?, ?, ?, ?, ?)`;
    const values = [title, description, start, end, imageUrl, linkUrl];
    console.log(values);
    const compareDates = (d1, d2) => {
        let date1 = new Date(d1).getTime();
        let date2 = new Date(d2).getTime();
        if (date1 < date2) {
            return true;
        }
        else if (date1 > date2) {
            return false;
        }
        else {
            return false;
        }
    };
    if (compareDates(end, start)) {
        console.log('date error');
        response.status(500).json({ error: 'start date is after end date' });
    }
    else {
        try {
            await dbconfig.execute(sql, values);
            response.status(200).send(`${title} inserted succesfully`);
        }
        catch (error) {
            response.status(500).json({ error: error.message });
        }
    }
});
export default eventRouter;
//# sourceMappingURL=events.js.map