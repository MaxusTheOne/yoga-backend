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
    const link = request.body.link;
    const linkDescription = request.body.linkDescription;
    const sql = `CALL postmedia(?,?,?,?,?)`;
    const values = [title, description, img, link, linkDescription];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
mediaRouter.delete('/:id', async (request, response) => {
    const id = request.params.id;
    const values = [id];
    const sql = `CALL deleteMedia(?)`;
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