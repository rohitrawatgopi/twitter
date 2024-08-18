import mongoose from "mongoose";
import ITweetInterface from "../interface/tweet.interface";

const tweetSchema = new mongoose.Schema<ITweetInterface>({
  adminId: {
    type: String,
    required: true,
  },
  tweetId: {
    type: String,
    required: true,
  },
  content: {
    type: String,
    required: true,
  },
  createdAt: {
    type: String,
  },
});
const TweetModel = mongoose.model<ITweetInterface>("TweetModel", tweetSchema);
export default TweetModel;
