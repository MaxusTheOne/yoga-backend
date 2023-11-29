import { Router } from 'express';
import { dbconfig } from '../database.js';
const userRouter = Router();
userRouter.get('/', async (request, response) => {
    const page = request.query.page || 1;
    const usersPerPage = request.query.usersPerPage || 501;
    const search = '';
    const sql = `CALL getUserPageFirstNameSearch(?, ?, ?)`;
    const values = [page, usersPerPage, search];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
userRouter.get('/members', async (request, response) => {
    console.log(request);
    const page = request.query.page || 1;
    const usersPerPage = request.query.usersPerPage || 501;
    const sql = `CALL getAllMembers(?, ?)`;
    const values = [page, usersPerPage];
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
userRouter.put('/:id/promote', async (request, response) => {
    const memberId = request.params.id;
    const sql = `CALL promoteToMember(?)`;
    const values = [memberId];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
userRouter.post('/eventSignup', async (request, response) => {
    const { eventId, userId } = request.body;
    const sql = `CALL associateUserEvent(?,?)`;
    const values = [eventId, userId];
    console.log(values);
    try {
        const [results] = await dbconfig.execute(sql, values);
        response.status(200).json(results[0]);
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
export default userRouter;
//# sourceMappingURL=users.js.map