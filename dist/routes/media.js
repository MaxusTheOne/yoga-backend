import { Router } from 'express';
import { dbconfig } from '../database.js';
const mediaRouter = Router();
mediaRouter.get('/', async (request, response) => {
    const sql = `CALL getMedia()`;
    console.log(request.body);
    try {
        const [results] = await dbconfig.execute(sql);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
mediaRouter.post('/', async (request, response) => {
    const title = request.body.title;
    const description = request.body.description;
    const img = request.body.img;
    const sql = `CALL postmedia(?,?,?)`;
    const values = [title, description, img];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
export default mediaRouter;
//# sourceMappingURL=media.js.map