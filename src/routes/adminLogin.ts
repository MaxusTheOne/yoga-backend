import { Router } from 'express'
import { dbconfig } from '../database.js'

const adminRouter = Router()

adminRouter.post('/', async (request, response) => {
    const { username, password } = request.body

    const sql = 'SELECT * FROM admin WHERE username = ? AND password = ?'
    const values = [username, password]

    try {
        await dbconfig.execute(sql, values)
        response.status(200).send(`login succesful`)
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

export default adminRouter
