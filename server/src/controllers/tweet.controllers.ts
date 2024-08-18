import { Request, Response } from "express";
import ITweetInterface from "../database/interface/tweet.interface";
import tweetRepositories from "../repositories/tweet.repository";

const tweetControllers = {
  getAllTweetController: async (req: Request, res: Response) => {
    console.log("getAllTweet");

    try {
      const allTweet = await tweetRepositories.getAllTweetRepo();

      res.status(200).json({
        data: allTweet,
        success: true,
      });
    } catch (error) {
      console.log("getAllTweetController" + error);
      res.status(500).json({
        data: "error",
        success: false,
      });
    }
  },
  createTweetController: async (req: Request, res: Response) => {
    console.log(" createTweetController");

    const tweet: ITweetInterface = req.body;

    try {
      const created = await tweetRepositories.createTweetRepo(tweet);
      if (tweet) {
        res.status(200).json({
          success: true,
          data: created,
        });
      }
    } catch (error) {
      console.log("createTweetController" + error);

      res.status(500).json({
        success: false,
        data: error,
      });
    }
  },
  updateTweetController: async (req: Request, res: Response) => {
    console.log(" updateTweetController");

    const newTweet = req.body;
    try {
      const updatedTweet = await tweetRepositories.updatedTweetRepo(
        newTweet.tweetId,
        newTweet
      );
      if (updatedTweet) {
        res.status(200).json({
          success: true,
          data: updatedTweet,
        });
      } else {
        res.status(500).json({
          success: false,
          data: "not tweet found",
        });
      }
    } catch (error) {
      console.log("updateTweetControllers" + error);
      res.status(500).json({
        success: false,
        data: error,
      });
    }
  },
  getTweetController: async (req: Request, res: Response) => {
    console.log(" getTweetController");

    try {
      const tweetId = req.params.tweetId as string;
      const success = await tweetRepositories.getTweetRepo(tweetId);
      if (success) {
        res.status(200).json({
          success: true,
          data: success,
        });
      } else {
        res.status(404).json({
          success: false,
          data: "not found",
        });
      }
    } catch (error) {
      console.log("getTweetController" + error);

      res.status(505).json({
        success: false,
        data: error,
      });
      console.log("getTweetController" + error);
    }
  },
  deleteTweetController: async (req: Request, res: Response) => {
    try {
      console.log(" deleteTweetController");

      const tweetId = req.params.tweetId as string;
      const deleteTweet = await tweetRepositories.deleteTweetRepo(tweetId);
      if (deleteTweet) {
        res.status(200).json({
          success: true,
          data: deleteTweet,
          msg: "deleted successfully",
        });
      } else {
        res.status(500).json({
          success: false,
          data: "no tweet found",
        });
      }
    } catch (error) {
      console.log("deleteTweetController" + error);
      res.status(505).json({
        success: false,
        data: error,
      });
    }
  },
};
export default tweetControllers;
