// compile and run with: tsc && node ./dist/index.js (prob only works in bash)
import express from "express";
import cors from "cors";
import eventRouter from "./routes/events";
console.log("Hello world");

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(cors());

app.use("/events", eventRouter)

app.listen(port, () => {
  console.log(`app running on http://localhost:${port}`);
});