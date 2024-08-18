import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:twitter2/core/config.dart';
import 'package:twitter2/feature/tweet/model/tweet.dart';

class TweetRepo {
  static Future<List<TweetModel>> getAllTweet() async {
    final List<TweetModel> tweets = [];
    try {
      Dio dio = Dio();

      final response = await dio.get("${Config.serverUrl}tweet/getAllTweet");
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 || response.statusCode! <= 300) {
        for (int i = 0; i < response.data['data'].length; i++) {
          tweets.add(TweetModel.fromMap(response.data['data'][i]));
        }
      }
      log(
        "tweets" + tweets.first.tweet.content,
      );
      log("tweetsReveraw" + tweets.reversed.first.tweet.content.toString());

      return tweets.reversed.toList();
    } catch (e) {
      return [];
    }
  }
}
