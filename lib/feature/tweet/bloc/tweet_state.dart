part of 'tweet_bloc.dart';

@immutable
sealed class TweetState {}

final class TweetInitial extends TweetState {}

abstract class TweetActionState extends TweetState {}

class TweetErrorState extends TweetActionState {
  final String error;

  TweetErrorState({required this.error});
}

class TweetLoadingState extends TweetActionState {}

class TweetSuccessState extends TweetState {
  final List<TweetModel> data;

  TweetSuccessState({required this.data});
}
