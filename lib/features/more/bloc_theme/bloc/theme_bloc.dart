// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'theme_event.dart';
// part 'theme_state.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeInitial()) {
//     on<ThemeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'theme_event.dart';
// import 'theme_state.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc()
//       : super(ThemeState(themeData: ThemeData.light(), isDark: false)) {
//     on<ToggleTheme>((event, emit) {
//       final newIsDark = !state.isDark;
//       emit(ThemeState(
//         themeData: newIsDark ? ThemeData.dark() : ThemeData.light(),
//         isDark: newIsDark,
//       ));
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/core/database/cache/cache_helper.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light(), isDark: false)) {
    on<ToggleTheme>((event, emit) async {
      final newIsDark = !state.isDark;
      await CacheHelper.setBool('isDark', newIsDark);
      emit(ThemeState(
        themeData: newIsDark ? ThemeData.dark() : ThemeData.light(),
        isDark: newIsDark,
      ));
    });

    _loadTheme();
  }

  void _loadTheme() {
    final savedDark = CacheHelper.getBool('isDark', defaultValue: false);
    if (savedDark != state.isDark) {
      add(ToggleTheme());
    }
  }
}