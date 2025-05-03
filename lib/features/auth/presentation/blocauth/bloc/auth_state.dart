// part of 'auth_bloc.dart';

// sealed class AuthState extends Equatable {
//   const AuthState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AuthInitial extends AuthState {}

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}
class Unauthenticated extends AuthState {}
class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message} );

  @override
  List<Object?> get props => [message];
}