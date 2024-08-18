import { Router } from "express";
import helloRouter from "./hello.router";
import tweetRouter from "./tweet.router";
import userRouter from "./user.router";
const router = Router();
router.use("/hello", helloRouter);
router.use("/user", userRouter);
router.use("/tweet", tweetRouter);
export default router;
