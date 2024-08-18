import { Request, Response } from "express";
import { IUserInterface } from "../database/interface/user.interface";

import userRepositories from "../repositories/user.repository";
const userControllers = {
  createUserController: async (req: Request, res: Response) => {
    console.log("userControllers");
    try {
      const user: IUserInterface = req.body;
      console.log("usesr");
      console.log(user.createdAt);
      console.log(req.body);

      const createUser = await userRepositories.createUserRepo(user);
      console.log(createUser);

      if (createUser) {
        res.status(200).json({
          success: "true",
          data: createUser,
        });
      } else {
        res.status(500).json({
          success: "fale",
          data: "please fill all data",
        });
      }
    } catch (error) {
      res.status(500).json({
        success: "false",
      });

      console.log("createUserController" + error);
    }
  },
  getUserController: async (req: Request, res: Response) => {
    console.log(" getUserController");

    try {
      const userId = req.params.userId;
      console.log("usserID");

      console.log(userId);

      if (userId) {
        const user: IUserInterface | null = await userRepositories.getUserRepo(
          userId
        );
        if (user) {
          res.status(200).json({
            success: true,
            data: user,
          });
        } else {
          res.status(505).json({
            success: false,
            data: "user not found ",
          });
        }
      } else {
        res.status(505).json({
          success: false,
          data: "check your url ",
        });
      }
    } catch (error) {
      console.log("getUSerController" + error);

      res.status(500).json({
        success: false,
      });
    }
  },
  updateUserController: async (req: Request, res: Response) => {
    try {
      console.log("updateUsercontroller");

      const updateUser: IUserInterface = await req.body;
      console.log(req.body);
      console.log(updateUser);

      console.log(updateUser.uid);

      const newUser = await userRepositories.updateUserRepo(
        updateUser.uid,
        updateUser
      );

      res.status(200).json({
        success: true,

        data: newUser,
      });
    } catch (error) {
      console.log("updateUserController" + error);

      res.status(500).json({
        success: false,

        data: "error found ",
      });
    }
  },
  deleteUserController: async (req: Request, res: Response) => {
    try {
      console.log("deleteUserController");

      const userId = req.params.userId as string;
      if (userId) {
        const deleted = await userRepositories.deleteUserRepo(userId);
        if (deleted) {
          res.status(200).json({
            success: true,

            data: "deleted succesfully ",
          });
        } else {
          res.status(500).json({
            success: false,

            data: "account not found  ",
          });
        }
      }
    } catch (error) {
      console.log("deleteUserController" + error);

      res.status(500).json({
        success: false,

        data: "error found ",
      });
    }
  },
};
export default userControllers;
