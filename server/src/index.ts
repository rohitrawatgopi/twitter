import bodyParser from "body-parser";
import cors from "cors";

import express, { Express } from "express";
import http from "http";
import mongoose from "mongoose";
import router from "./routes/router";
const app: Express = express();
const server = http.createServer(app);

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set("PORT", 3000);
app.use("/api/v1", router);

const mongoose_url: String = "mongodb://localhost:27017";
console.log(mongoose_url);

if (!mongoose_url) {
  console.error("mongoose url not find ");
  process.exit(1);
} else {
  mongoose
    .connect("mongodb://localhost:27017")
    .then(() => {
      console.log(mongoose_url);

      console.log("Mongo db connect successfully");
    })
    .catch((error) => console.log(error));
}

try {
  const port: Number = app.get("PORT");

  app.listen(port, (): void => {
    console.log("server listening ");
  });
} catch (error) {
  console.log(error);
}
export default server;
