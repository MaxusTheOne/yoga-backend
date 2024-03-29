// compile and run with: tsc && npm start (bash)
import express from 'express'
import cors from 'cors'
import eventRouter from './routes/events.js'
import userRouter from './routes/users.js'
import mediaRouter from './routes/media.js'
import adminRouter from './routes/adminLogin.js'

console.log('Hello world :)')

const app = express()
const port = process.env.PORT || 3000

app.use(express.json())
app.use(cors())

// Restfull Routing
app.use('/events', eventRouter)
app.use('/users', userRouter)
app.use('/media', mediaRouter)
app.use('/admin', adminRouter)

app.listen(port, () => {
    console.log(`app running on http://localhost:${port}`)
})
