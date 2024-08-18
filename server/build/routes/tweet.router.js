"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const tweet_controllers_1 = __importDefault(require("../controllers/tweet.controllers"));
const tweetRouter = (0, express_1.Router)();
tweetRouter.get("/getTweet:tweetId", tweet_controllers_1.default.getTweetController);
tweetRouter.get("/getAllTweet", tweet_controllers_1.default.getAllTweetController);
tweetRouter.post("/", tweet_controllers_1.default.createTweetController);
tweetRouter.delete("/:tweetId", tweet_controllers_1.default.deleteTweetController);
tweetRouter.put("/", tweet_controllers_1.default.updateTweetController);
exports.default = tweetRouter;
