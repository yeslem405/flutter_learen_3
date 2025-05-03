// part of 'locale_bloc.dart';


// @immutable
// sealed class LocaleEvent {}


// import 'package:equatable/equatable.dart';

// abstract class LocaleEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class ChangeLocale extends LocaleEvent {
//   final String languageCode;

//   ChangeLocale(this.languageCode);

//   @override
//   List<Object?> get props => [languageCode];
// }

import 'package:equatable/equatable.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocale extends LocaleEvent {
  final String languageCode;

  const ChangeLocale(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}