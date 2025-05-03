// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'connectivity_event.dart';
// part 'connectivity_state.dart';

// class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
//   ConnectivityBloc() : super(ConnectivityInitial()) {
//     on<ConnectivityEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription _subscription;

  ConnectivityBloc() : super(const ConnectivityState(isConnected: true)) {
    on<ConnectivityChanged>((event, emit) {
      emit(ConnectivityState(isConnected: event.isConnected));
    });

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      bool isConnected = result != ConnectivityResult.none;
      add(ConnectivityChanged(isConnected));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}