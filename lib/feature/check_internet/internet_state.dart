// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetConnectedState extends InternetState {
  final String msg;
  InternetConnectedState({
    required this.msg,
  });
}

abstract class InternetActionState extends InternetState {}

class InternetLostState extends InternetState {}
