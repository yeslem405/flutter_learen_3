// part of 'locale_bloc.dart';

// @immutable
// sealed class LocaleState {}



// import 'package:flutter/material.dart';
// import 'package:equatable/equatable.dart';

// class LocaleState extends Equatable {
//   final Locale locale;

//   const LocaleState({required this.locale});

//   @override
//   List<Object?> get props => [locale];
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  @override
  List<Object> get props => [locale];
}