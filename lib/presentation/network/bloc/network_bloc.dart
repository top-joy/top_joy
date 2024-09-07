import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:top_joy/presentation/network/bloc/network_event.dart';
import 'package:top_joy/presentation/network/bloc/network_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription _connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result[0] == ConnectivityResult.none) {
        add(InternetDisconnected());
      } else {
        add(InternetConnected());
      }
    });

    on<InternetConnected>((event, emit) => emit(InternetConnectedState()));
    on<InternetDisconnected>(
        (event, emit) => emit(InternetDisconnectedState()));
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
