import { Router } from "express";
import tweetControllers from "../controllers/tweet.controllers";

const tweetRouter = Router();
tweetRouter.get("/getTweet:tweetId", tweetControllers.getTweetController);
tweetRouter.get("/getAllTweet", tweetControllers.getAllTweetController);
tweetRouter.post("/", tweetControllers.createTweetController);
tweetRouter.delete("/:tweetId", tweetControllers.deleteTweetController);
tweetRouter.put("/", tweetControllers.updateTweetController);
export default tweetRouter;
