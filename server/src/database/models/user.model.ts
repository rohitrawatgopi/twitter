import mongoose, { Schema } from "mongoose";
import { IUserInterface } from "../interface/user.interface";

const userSchema = new Schema<IUserInterface>({
  uid: { type: String, required: false },
  tweets: { type: [String], default: [] },
  firstName: { type: String, default: "User" },
  lastName: { type: String, default: "Name" },
  email: {
    type: String,
    required: false,
  },
  createdAt: { type: String, required: false },
});

const UserModel = mongoose.model<IUserInterface>("UserModel", userSchema);
export default UserModel;
