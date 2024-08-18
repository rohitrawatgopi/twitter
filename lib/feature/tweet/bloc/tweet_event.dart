part of 'tweet_bloc.dart';

@immutable
sealed class TweetEvent {}

class FetchAllTweetEvent extends TweetEvent {}
