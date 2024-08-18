import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:twitter2/core/local_database/shared_pre.dart';
import 'package:twitter2/feature/on_boarding/ui/onbosrding_screen.dart';
import 'package:twitter2/feature/tweet/ui/tweet_page.dart';

class DecidedPage extends StatefulWidget {
  static StreamController<String?> authStream = StreamController.broadcast();
  const DecidedPage({super.key});

  @override
  State<DecidedPage> createState() => _DecidedPageState();
}

class _DecidedPageState extends State<DecidedPage> {
  @override
  void initState() {
    getUid();
    DecidedPage.authStream.add("");
    super.initState();
  }

  getUid() async {
    String uid = await SharedPreferencesManager.getUid();

    if (uid.isEmpty) {
      log("no data");
      DecidedPage.authStream.add("");
    } else {
      log(uid);
      DecidedPage.authStream.add(uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DecidedPage.authStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return TweetScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return OnboardingScreen();
          }
        });
  }
}
