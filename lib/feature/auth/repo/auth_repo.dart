import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:twitter2/core/config.dart';
import 'package:twitter2/feature/auth/models/user_model.dart';

class AuthRepo {
  static Future<UserModel?> getUserRepo(String uid) async {
    print("getuser");
    log(uid);
    try {
      Dio dio = Dio();
      final response = await dio.get(
        "${Config.serverUrl}/user/${uid}",
        options: Options(sendTimeout: const Duration(seconds: 12)),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      if (response.statusCode! <= 300 && response.statusCode! >= 200) {
        UserModel userModel = UserModel.fromMap(response.data);
        return userModel;
      } else {
        log("status code error");
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> createUser(UserModel name) async {
    Dio dio = Dio();

    try {
      log("create user repo is called");

      final response = await dio.post(
        "http://192.168.1.4:3000/api/v1/user/",
        options: Options(sendTimeout: Duration(seconds: 12)),
        data: name.toMap(),
      );
      print(response.statusCode.toString());
      if (response.statusCode! <= 300 && response.statusCode! >= 200) {
        return true;
      } else {
        log("status code create user ");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
