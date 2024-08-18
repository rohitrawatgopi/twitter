import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:twitter2/feature/tweet/model/tweet.dart';
import 'package:twitter2/feature/tweet/repo/tweet.dart';

part 'tweet_event.dart';
part 'tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  TweetBloc() : super(TweetInitial()) {
    on<FetchAllTweetEvent>(fetchAllTweetEvent);
  }

  FutureOr<void> fetchAllTweetEvent(
      FetchAllTweetEvent event, Emitter<TweetState> emit) async {
    final List<TweetModel> success = await TweetRepo.getAllTweet();

    emit(TweetSuccessState(data: success));
  }
}
