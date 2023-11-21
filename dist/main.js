"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const events_1 = __importDefault(require("./routes/events"));
console.log("Hello world");
const app = (0, express_1.default)();
const port = process.env.PORT || 3000;
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use("/events", events_1.default);
app.listen(port, () => {
    console.log(`app running on http://localhost:${port}`);
});
//# sourceMappingURL=main.js.map