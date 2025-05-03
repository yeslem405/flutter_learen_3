// part of 'connectivity_bloc.dart';

// sealed class ConnectivityEvent extends Equatable {
//   const ConnectivityEvent();

//   @override
//   List<Object> get props => [];
// }

import 'package:equatable/equatable.dart';

abstract class ConnectivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectivityChanged extends ConnectivityEvent {
  final bool isConnected;

  ConnectivityChanged(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}