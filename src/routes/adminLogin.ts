import { Router } from 'express'
import { dbconfig } from '../database.js'
// only the most secure coding in here
const adminRouter = Router()

// Checks if the given username and password is in the admin table
// it's a post cuz thats more secure I guess
adminRouter.post('/', async (request, response) => {
    const { username, password } = request.body

    const sql = 'SELECT * FROM admin WHERE username = ? AND password = ?'
    const values = [username, password]

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        if (results.length > 0) {
            response.status(200).send(`Login successful`)
        } else {
            response.status(401).json({ error: 'Invalid credentials' })
        }
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

export default adminRouter
