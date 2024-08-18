// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter2/feature/create_tweet/bloc/create_tweet_bloc.dart';
import 'package:twitter2/feature/tweet/bloc/tweet_bloc.dart';

class CreateTweetScreen extends StatelessWidget {
  final TweetBloc tweetBloc;

  CreateTweetScreen({
    Key? key,
    required this.tweetBloc,
  }) : super(key: key);
  final contentController = TextEditingController();
  CreateTweetBloc createTweetBloc = CreateTweetBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTweetBloc, CreateTweetState>(
      bloc: createTweetBloc,
      listenWhen: (previous, current) => current is CreateTweetActionState,
      buildWhen: (previous, current) => current is! CreateTweetActionState,
      listener: (context, state) {
        if (state is CreateTweetErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is CreateTweetSuccessState) {
          tweetBloc.add(FetchAllTweetEvent());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.successMsg)));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        createTweetBloc.add(CreateNewTweetEvent(
                            content: contentController.text));
                      },
                      child: const Text("Post"))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                maxLines: 30,
                maxLength: 1000,
                minLines: 1,
                controller: contentController,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "What's on your mind 🤯 ",
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
