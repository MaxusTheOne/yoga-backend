import { Router } from 'express'

const defaultRouter = Router()

defaultRouter.get('/', async (request, response) => {
    //Root path

    console.log(request)

    response.status(200).json({
        msg: 'Welcome to the YogaBackend! Add /events, /users, or /media to the root path to see more data.',
    })
})
export default defaultRouter
