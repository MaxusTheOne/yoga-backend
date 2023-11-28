import { Router } from 'express'
import { dbconfig } from '../database.js'

const mediaRouter = Router()

mediaRouter.get('/', async (request, response) => {
    const sql = `CALL getMedia()`
    console.log(request.body)
    //error handling for more robust code :)
    try {
        const [results]: any = await dbconfig.execute(sql)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

//{"title": "Cool event", "description": "no", "img":"https://i.natgeofe.com/n/d472dd3c-8d38-4eed-ae62-7472a12a17de/secretary-bird-thumbnail-nationalgeographic_2331336_3x2.jpg","",""}

//{"title": "Cool event", "description": "no", "img":"https://i.natgeofe.com/n/d472dd3c-8d38-4eed-ae62-7472a12a17de/secretary-bird-thumbnail-nationalgeographic_2331336_3x2.jpg","https://www.youtube.com/watch?v=G-rsmbK7gdY","wow see this cool video"}

mediaRouter.post('/', async (request, response) => {
    const title = request.body.title
    const description = request.body.description
    const img = request.body.img
    const link = request.body.link
    const linkDescription = request.body.linkDescription
    const sql = `CALL postmedia(?,?,?,?,?)`
    const values = [title, description, img, link, linkDescription]
    console.log(values)

    try {
        const [results]: any = await dbconfig.execute(sql, values)

        response.status(200).json(results[0])
    } catch (error: any) {
        response.status(500).json({ error: error.message })
    }
})

export default mediaRouter
