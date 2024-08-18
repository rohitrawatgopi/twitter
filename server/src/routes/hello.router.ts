import { Request, Response, Router } from "express";

const helloRouter = Router();
helloRouter.get("/", (req: Request, res: Response) => {
  console.log("hello router ");
  res.json({
    data: "server is live",
  });
});
export default helloRouter;
