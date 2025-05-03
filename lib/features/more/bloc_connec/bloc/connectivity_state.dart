// part of 'connectivity_bloc.dart';

// sealed class ConnectivityState extends Equatable {
//   const ConnectivityState();
  
//   @override
//   List<Object> get props => [];
// }

// final class ConnectivityInitial extends ConnectivityState {}

import 'package:equatable/equatable.dart';

class ConnectivityState extends Equatable {
  final bool isConnected;

  const ConnectivityState({required this.isConnected});

  @override
  List<Object?> get props => [isConnected];
}