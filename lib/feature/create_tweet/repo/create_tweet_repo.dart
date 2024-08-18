import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:twitter2/core/config.dart';

class CreateTweetRepo {
  static Future<bool> createTweet(
      String adminId, tweetId, content, DateTime createdAt) async {
    try {
      Dio dio = Dio();

      final respose = await dio.post("${Config.serverUrl}tweet/", data: {
        "tweetId": tweetId,
        "adminId": adminId,
        "content": content,
        "createdAt": createdAt.toIso8601String()
      });
      if (respose.statusCode! >= 200 || respose.statusCode! <= 300) {
        print("createTweetREPO");
        return true;
      } else {
        log("error found");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
