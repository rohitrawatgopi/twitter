import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter2/feature/check_internet/internet_event.dart';
import 'package:twitter2/feature/check_internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  StreamSubscription? streamSubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectedEVent>(internetConnectedEVent);
    on<InternetLostEvent>(internetLostEvent);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((data) {
      if (data.contains(ConnectivityResult.mobile) ||
          data.contains(ConnectivityResult.wifi)) {
        add(InternetConnectedEVent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  FutureOr<void> internetConnectedEVent(
      InternetConnectedEVent event, Emitter emit) {
    emit(InternetConnectedState(msg: "Internet "));
  }

  FutureOr<void> internetLostEvent(InternetLostEvent event, Emitter emit) {
    emit(InternetLostState());
  }
}
