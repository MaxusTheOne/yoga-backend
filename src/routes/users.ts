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

// changes a user from guest to member by ID
userRouter.put('/:id/promote', async (request, response) => {
    const memberId = request.params.id
    const sql = `CALL promoteToMember(?)`
    const values = [memberId]
    console.log(values)

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

// associates a user with an event by ID
userRouter.post('/eventSignup', async (request, response) => {
    const { eventId, userId } = request.body

    const sql = `CALL associateUserEvent(?,?)`
    const values = [userId, eventId]

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

//posts users info to database
userRouter.post('/userSignup', async (request, response) => {
    const age = request.body.age
    const firstName = request.body.firstName
    const lastName = request.body.lastName
    const activityLevel = request.body.activityLevel
    const phone = request.body.phone
    const email = request.body.email
    const sql = `CALL postUser(?,?,?,?,?,?)`
    const values = [age, firstName, lastName, activityLevel, phone, email]
    console.log(values)

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

// gets members by activity level
// gets all users sorted by activityLevel
userRouter.get('/activityLevel', async (request, response) => {
    console.log(request)
    const sql = `CALL getUsersByActivityLevel()`
    //error handling for more robust code :)
    try {
        const [results]: any = await dbconfig.execute(sql)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

// Retrieve user ID by email
userRouter.get('/userIdByEmail', async (request, response) => {
    const userEmail = request.query.email
    const sql = 'SELECT id FROM users WHERE email = ?'
    const values = [userEmail]

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        if (results.length > 0) {
            response.status(200).json({ userId: results[0].id })
        } else {
            response.status(404).json({ error: 'User not found' })
        }
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

export default userRouter
