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
const user_model_1 = __importDefault(require("../database/models/user.model"));
const userRepositories = {
    createUserRepo: (newUser) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log("newwUser" + newUser.createdAt);
            const user = yield user_model_1.default.create(newUser);
            if (user) {
                return user;
            }
            else {
                return false;
            }
        }
        catch (error) {
            console.log(error);
            return false;
        }
    }),
    getUserRepo: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const user = yield user_model_1.default.findOne({ uid: userId });
            if (user) {
                return user;
            }
            else {
                return null;
            }
        }
        catch (error) {
            console.log("getUserRepo");
            return null;
            console.log(error);
        }
    }),
    updateUserRepo: (userId, updatedUser) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const updateUser = yield user_model_1.default.findOneAndUpdate({
                uid: userId,
            }, updatedUser);
            console.log("updatedUer" + updateUser);
            console.log("update" + updateUser);
            return updatedUser;
        }
        catch (error) {
            console.log("updatedUSser");
            return false;
        }
    }),
    deleteUserRepo: (userId) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const deleteUSer = yield user_model_1.default.findOneAndDelete({ uid: userId });
            if (deleteUSer) {
                return true;
            }
            else {
                return false;
            }
        }
        catch (error) {
            console.log(error);
            return false;
        }
    }),
};
exports.default = userRepositories;
