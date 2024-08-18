// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:twitter2/BLOC/Theme/theme_data_bloc.dart';
import 'package:twitter2/BLOC/Theme/theme_data_event.dart';
import 'package:twitter2/app.dart';
import 'package:twitter2/core/local_database/shared_pre.dart';
import 'package:twitter2/design/app_theme.dart';
import 'package:twitter2/design/widgets/logo.dart';
import 'package:twitter2/feature/create_tweet/ui/createtweet.dart';
import 'package:twitter2/feature/tweet/bloc/tweet_bloc.dart';

class TweetScreen extends StatefulWidget {
  const TweetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TweetScreen> createState() => _TweetScreenState();
}

class _TweetScreenState extends State<TweetScreen> {
  TweetBloc tweetBloc = TweetBloc();
  @override
  void initState() {
    tweetBloc.add(FetchAllTweetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Divider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: (() {
                  print("logout");
                  SharedPreferencesManager.deleteUid();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => DecidedPage()),
                      (route) => route.isFirst);
                }),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTweetScreen(
                  tweetBloc: tweetBloc,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          AdvancedSwitch(
            initialValue: false,
            onChanged: (value) {
              BlocProvider.of<ThemeDataBloc>(context).add(ThemeChangeEvent(
                  themeData: value == false
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme));
            },
          )
        ],
        title: const LogoImage(),
        centerTitle: true,
      ),
      body: BlocConsumer<TweetBloc, TweetState>(
        bloc: tweetBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case TweetLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case TweetSuccessState:
              final successState = state as TweetSuccessState;
              successState.data.reversed;
              if (successState.data.length > 0) {
                return Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                        itemCount: successState.data.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 32,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  successState.data[index].tweet.content,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tweeted by: " +
                                          successState
                                              .data[index].admin.firstName +
                                          " " +
                                          successState
                                              .data[index].admin.lastNAme,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      DateFormat("dd MMMM yyyy hh:mm a").format(
                                          successState
                                              .data[index].tweet.createdAt),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                );
              } else {
                return Text("No Tweet found ");
              }
            case TweetErrorState:
              final error = state as TweetErrorState;
              return Expanded(
                  child: Container(
                child: Text(error.error),
              ));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
