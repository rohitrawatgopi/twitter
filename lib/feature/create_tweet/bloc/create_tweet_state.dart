part of 'create_tweet_bloc.dart';

@immutable
sealed class CreateTweetState {}

abstract class CreateTweetActionState extends CreateTweetState {}

final class CreateTweetInitial extends CreateTweetState {}

class CreateTweetErrorState extends CreateTweetActionState {
  final String error;

  CreateTweetErrorState({required this.error});
}

class CreateTweetSuccessState extends CreateTweetActionState {
  final String successMsg;

  CreateTweetSuccessState({required this.successMsg});
}
