import { Router } from "express";
import userControllers from "../controllers/user.controller";

const userRouter = Router();
userRouter.get("/:userId", userControllers.getUserController);
userRouter.post("/", userControllers.createUserController);
userRouter.delete("/:userId", userControllers.deleteUserController);
userRouter.put("/", userControllers.updateUserController);
export default userRouter;
