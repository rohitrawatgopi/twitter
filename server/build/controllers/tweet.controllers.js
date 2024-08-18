"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const tweet_repository_1 = __importDefault(require("../repositories/tweet.repository"));
const tweetControllers = {
    getAllTweetController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("getAllTweet");
        try {
            const allTweet = yield tweet_repository_1.default.getAllTweetRepo();
            res.status(200).json({
                data: allTweet,
                success: true,
            });
        }
        catch (error) {
            console.log("getAllTweetController" + error);
            res.status(500).json({
                data: "error",
                success: false,
            });
        }
    }),
    createTweetController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log(" createTweetController");
        const tweet = req.body;
        try {
            const created = yield tweet_repository_1.default.createTweetRepo(tweet);
            if (tweet) {
                res.status(200).json({
                    success: true,
                    data: created,
                });
            }
        }
        catch (error) {
            console.log("createTweetController" + error);
            res.status(500).json({
                success: false,
                data: error,
            });
        }
    }),
    updateTweetController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log(" updateTweetController");
        const newTweet = req.body;
        try {
            const updatedTweet = yield tweet_repository_1.default.updatedTweetRepo(newTweet.tweetId, newTweet);
            if (updatedTweet) {
                res.status(200).json({
                    success: true,
                    data: updatedTweet,
                });
            }
            else {
                res.status(500).json({
                    success: false,
                    data: "not tweet found",
                });
            }
        }
        catch (error) {
            console.log("updateTweetControllers" + error);
            res.status(500).json({
                success: false,
                data: error,
            });
        }
    }),
    getTweetController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log(" getTweetController");
        try {
            const tweetId = req.params.tweetId;
            const success = yield tweet_repository_1.default.getTweetRepo(tweetId);
            if (success) {
                res.status(200).json({
                    success: true,
                    data: success,
                });
            }
            else {
                res.status(404).json({
                    success: false,
                    data: "not found",
                });
            }
        }
        catch (error) {
            console.log("getTweetController" + error);
            res.status(505).json({
                success: false,
                data: error,
            });
            console.log("getTweetController" + error);
        }
    }),
    deleteTweetController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log(" deleteTweetController");
            const tweetId = req.params.tweetId;
            const deleteTweet = yield tweet_repository_1.default.deleteTweetRepo(tweetId);
            if (deleteTweet) {
                res.status(200).json({
                    success: true,
                    data: deleteTweet,
                    msg: "deleted successfully",
                });
            }
            else {
                res.status(500).json({
                    success: false,
                    data: "no tweet found",
                });
            }
        }
        catch (error) {
            console.log("deleteTweetController" + error);
            res.status(505).json({
                success: false,
                data: error,
            });
        }
    }),
};
exports.default = tweetControllers;
