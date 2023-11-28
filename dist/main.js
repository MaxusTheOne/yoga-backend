import express from 'express';
import cors from 'cors';
import eventRouter from './routes/events.js';
import userRouter from './routes/users.js';
import mediaRouter from './routes/media.js';
console.log('Hello world');
const app = express();
const port = process.env.PORT || 3000;
app.use(express.json());
app.use(cors());
app.use('/events', eventRouter);
app.use('/users', userRouter);
app.use('/media', mediaRouter);
app.listen(port, () => {
    console.log(`app running on http://localhost:${port}`);
});
//# sourceMappingURL=main.js.map