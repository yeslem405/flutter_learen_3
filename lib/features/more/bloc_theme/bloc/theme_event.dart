// part of 'theme_bloc.dart';

// sealed class ThemeEvent extends Equatable {
//   const ThemeEvent();

//   @override
//   List<Object> get props => [];
// }

import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleTheme extends ThemeEvent {} // حدث لتغيير الثيم