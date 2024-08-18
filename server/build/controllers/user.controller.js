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
const user_repository_1 = __importDefault(require("../repositories/user.repository"));
const userControllers = {
    createUserController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("userControllers");
        try {
            const user = req.body;
            console.log("usesr");
            console.log(user.createdAt);
            console.log(req.body);
            const createUser = yield user_repository_1.default.createUserRepo(user);
            console.log(createUser);
            if (createUser) {
                res.status(200).json({
                    success: "true",
                    data: createUser,
                });
            }
            else {
                res.status(500).json({
                    success: "fale",
                    data: "please fill all data",
                });
            }
        }
        catch (error) {
            res.status(500).json({
                success: "false",
            });
            console.log("createUserController" + error);
        }
    }),
    getUserController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log(" getUserController");
        try {
            const userId = req.params.userId;
            console.log("usserID");
            console.log(userId);
            if (userId) {
                const user = yield user_repository_1.default.getUserRepo(userId);
                if (user) {
                    res.status(200).json({
                        success: true,
                        data: user,
                    });
                }
                else {
                    res.status(505).json({
                        success: false,
                        data: "user not found ",
                    });
                }
            }
            else {
                res.status(505).json({
                    success: false,
                    data: "check your url ",
                });
            }
        }
        catch (error) {
            console.log("getUSerController" + error);
            res.status(500).json({
                success: false,
            });
        }
    }),
    updateUserController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("updateUsercontroller");
            const updateUser = yield req.body;
            console.log(req.body);
            console.log(updateUser);
            console.log(updateUser.uid);
            const newUser = yield user_repository_1.default.updateUserRepo(updateUser.uid, updateUser);
            res.status(200).json({
                success: true,
                data: newUser,
            });
        }
        catch (error) {
            console.log("updateUserController" + error);
            res.status(500).json({
                success: false,
                data: "error found ",
            });
        }
    }),
    deleteUserController: (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("deleteUserController");
            const userId = req.params.userId;
            if (userId) {
                const deleted = yield user_repository_1.default.deleteUserRepo(userId);
                if (deleted) {
                    res.status(200).json({
                        success: true,
                        data: "deleted succesfully ",
                    });
                }
                else {
                    res.status(500).json({
                        success: false,
                        data: "account not found  ",
                    });
                }
            }
        }
        catch (error) {
            console.log("deleteUserController" + error);
            res.status(500).json({
                success: false,
                data: "error found ",
            });
        }
    }),
};
exports.default = userControllers;
