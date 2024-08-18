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
const tweet_model_1 = __importDefault(require("../database/models/tweet.model"));
const user_model_1 = __importDefault(require("../database/models/user.model"));
const user_repository_1 = __importDefault(require("./user.repository"));
const tweetRepositories = {
    getAllTweetRepo: () => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const tweets = yield tweet_model_1.default.find();
            console.log(tweets);
            if (tweets.length == 0 && tweets == null) {
                return null;
            }
            const tweetWithUserInfo = yield Promise.all(tweets.map((tweet) => __awaiter(void 0, void 0, void 0, function* () {
                const admin = yield user_model_1.default.findOne({ uid: tweet.adminId });
                if (!admin) {
                    return { tweet, admin: null };
                }
                return { tweet, admin };
            })));
            console.log(tweetWithUserInfo + "vfv");
            return tweetWithUserInfo;
        }
        catch (error) {
            console.log(error);
            return null;
        }
    }),
    createTweetRepo: (tweet) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const createTweet = yield tweet_model_1.default.create(tweet);
            const updateUser = yield user_repository_1.default.updateUserUsingTweetIdRepo(tweet.adminId, tweet.tweetId);
            console.log(updateUser);
            if (createTweet) {
                return createTweet;
            }
            else {
                return false;
            }
        }
        catch (error) {
            console.log("createTweetRepo" + error);
            return false;
        }
    }),
    getTweetRepo: (tweetId) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const tweet = yield tweet_model_1.default.findOne({ tweetId: tweetId });
            if (tweet) {
                return tweet;
            }
            else {
                return null;
            }
        }
        catch (error) {
            console.log("getTweetRepo" + error);
            return null;
        }
    }),
    updatedTweetRepo: (tweetId, updateTweet) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const updatedTweet = yield tweet_model_1.default.findOneAndUpdate({ tweetId: tweetId }, updateTweet);
            if (updateTweet) {
                return updateTweet;
            }
            else {
                return false;
            }
        }
        catch (error) {
            console.log("updatedTweetrepo" + error);
            return false;
        }
    }),
    deleteTweetRepo: (tweetId) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const success = yield tweet_model_1.default.findOneAndDelete({ tweetId: tweetId });
            if (success) {
                return true;
            }
            else {
                return false;
            }
        }
        catch (error) {
            console.log("deleteTweetRepo" + error);
            return false;
        }
    }),
};
exports.default = tweetRepositories;
