import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:twitter2/feature/create_tweet/repo/create_tweet_repo.dart';
import 'package:uuid/uuid.dart';

part 'create_tweet_event.dart';
part 'create_tweet_state.dart';

class CreateTweetBloc extends Bloc<CreateTweetEvent, CreateTweetState> {
  CreateTweetBloc() : super(CreateTweetInitial()) {
    on<CreateNewTweetEvent>(createNewTweetEvent);
  }

  FutureOr<void> createNewTweetEvent(
      CreateNewTweetEvent event, Emitter<CreateTweetState> emit) async {
    const Uuid uuid = Uuid();
    try {
      final String tweetId = uuid.v4();
      final String adminId = FirebaseAuth.instance.currentUser?.uid ?? "";
      if (adminId.isNotEmpty) {
        final success = await CreateTweetRepo.createTweet(
            adminId, tweetId, event.content, DateTime.now());

        if (success) {
          emit(CreateTweetSuccessState(
              successMsg: "Your Tweet Posted Successfully"));
        } else {
          emit(CreateTweetErrorState(error: "Something Went wrong"));
        }
      }
    } catch (e) {
      log(e.toString());
      emit(CreateTweetErrorState(error: e.toString()));
    }
  }
}
