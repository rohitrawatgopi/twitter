import { Document } from "mongoose";

export interface ITweetInterface extends Document {
  tweetId: String;
  adminId: String;
  content: String;
  createdAt: String;
}
export default ITweetInterface;
