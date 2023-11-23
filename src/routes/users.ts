import { Router } from 'express'
import { dbconfig } from '../database.js'

const userRouter = Router()

// gets all users
userRouter.get('/', async (request, response) => {
    const page = request.query.page || 1
    const usersPerPage = request.query.usersPerPage || 501
    const search = ''
    const sql = `CALL getUserPageFirstNameSearch(?, ?, ?)`
    const values = [page, usersPerPage, search]
    console.log(values)

    //error handling for more robust code :)
    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

// gets all members, optional ?page&&usersPerPage
userRouter.get('/members', async (request, response) => {
    console.log(request)
    const page = request.query.page || 1
    const usersPerPage = request.query.usersPerPage || 501
    const sql = `CALL getAllMembers(?, ?)`
    const values = [page, usersPerPage]

    //error handling for more robust code :)
    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})
export default userRouter
