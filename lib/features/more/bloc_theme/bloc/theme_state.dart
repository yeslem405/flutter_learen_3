// part of 'theme_bloc.dart';

// sealed class ThemeState extends Equatable {
//   const ThemeState();
  
//   @override
//   List<Object> get props => [];
// }

// final class ThemeInitial extends ThemeState {}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDark;

  const ThemeState({required this.themeData, required this.isDark});

  @override
  List<Object?> get props => [themeData, isDark];
}