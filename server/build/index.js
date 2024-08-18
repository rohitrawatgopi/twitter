"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const body_parser_1 = __importDefault(require("body-parser"));
const cors_1 = __importDefault(require("cors"));
const express_1 = __importDefault(require("express"));
const http_1 = __importDefault(require("http"));
const mongoose_1 = __importDefault(require("mongoose"));
const router_1 = __importDefault(require("./routes/router"));
const app = (0, express_1.default)();
const server = http_1.default.createServer(app);
app.use((0, cors_1.default)());
app.use(body_parser_1.default.json());
app.use(body_parser_1.default.urlencoded({ extended: true }));
app.set("PORT", 3000);
app.use("/api/v1", router_1.default);
const mongoose_url = "mongodb://localhost:27017";
console.log(mongoose_url);
if (!mongoose_url) {
    console.error("mongoose url not find ");
    process.exit(1);
}
else {
    mongoose_1.default
        .connect("mongodb://localhost:27017")
        .then(() => {
        console.log(mongoose_url);
        console.log("Mongo db connect successfully");
    })
        .catch((error) => console.log(error));
}
try {
    const port = app.get("PORT");
    app.listen(port, () => {
        console.log("server listening ");
    });
}
catch (error) {
    console.log(error);
}
exports.default = server;
