import { Router } from 'express';
import { dbconfig } from '../database.js';
const adminRouter = Router();
adminRouter.post('/', async (request, response) => {
    const { username, password } = request.body;
    const sql = 'SELECT * FROM admin WHERE username = ? AND password = ?';
    const values = [username, password];
    try {
        const [results] = await dbconfig.execute(sql, values);
        if (results.length > 0) {
            response.status(200).send(`Login successful`);
        }
        else {
            response.status(401).json({ error: 'Invalid credentials' });
        }
    }
    catch (error) {
        response.status(500).json({ error: error.message });
    }
});
export default adminRouter;
//# sourceMappingURL=adminLogin.js.map