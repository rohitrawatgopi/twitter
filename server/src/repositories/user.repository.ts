import { IUserInterface } from "../database/interface/user.interface";
import UserModel from "../database/models/user.model";
const userRepositories = {
  createUserRepo: async (
    newUser: IUserInterface
  ): Promise<boolean | IUserInterface> => {
    try {
      console.log("userControllersRepo");
      console.log("newwUser" + newUser.createdAt);

      const user = await UserModel.create(newUser);
      if (user) {
        return user;
      } else {
        return false;
      }
    } catch (error) {
      console.log(error);
      return false;
    }
  },
  getUserRepo: async (userId: string): Promise<IUserInterface | null> => {
    try {
      const user = await UserModel.findOne({ uid: userId });
      if (user) {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      console.log("getUserRepo");
      return null;
      console.log(error);
    }
  },
  updateUserRepo: async (
    userId: string,
    updatedUser: IUserInterface
  ): Promise<IUserInterface | boolean> => {
    try {
      const updateUser = await UserModel.findOneAndUpdate(
        {
          uid: userId,
        },
        updatedUser
      );
      console.log("updatedUer" + updateUser);

      console.log("update" + updateUser);

      return updatedUser;
    } catch (error) {
      console.log("updatedUSser");
      return false;
    }
  },
  deleteUserRepo: async (userId: string): Promise<Boolean> => {
    try {
      const deleteUSer = await UserModel.findOneAndDelete({ uid: userId });
      if (deleteUSer) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      console.log(error);
      return false;
    }
  },
  updateUserUsingTweetIdRepo: async (
    adminId: String,
    tweetId: String
  ): Promise<boolean | IUserInterface> => {
    try {
      const update = await UserModel.findOneAndUpdate(
        {
          uid: adminId,
        },
        { $push: { tweets: tweetId } }
      );
      if (update) {
        return update;
      } else {
        return false;
      }
    } catch (error) {
      console.log("updateUserUsingTweetIdRepo" + error);
      return false;
    }
  },
};
export default userRepositories;
