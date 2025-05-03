// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'locale_event.dart';
// part 'locale_state.dart';

// class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
//   LocaleBloc() : super(LocaleInitial()) {
//     on<LocaleEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'locale_event.dart';
// import 'locale_state.dart';

// class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
//   LocaleBloc() : super(LocaleState(locale: Locale('en'))) {
//     on<ChangeLocale>((event, emit) {
//       emit(LocaleState(locale: Locale(event.languageCode)));
//     });
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:learen_3/core/database/cache/cache_helper.dart';
// // import '../../core/cache/cache_helper.dart';
// import 'locale_event.dart';
// import 'locale_state.dart';

// class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
//   LocaleBloc() : super(const LocaleState(locale: Locale('en'))) {
//     on<ChangeLocale>((event, emit) async {
//       await CacheHelper.setString('languageCode', event.languageCode);
//       emit(LocaleState(locale: Locale(event.languageCode)));
//     });

//     _loadLocale();
//   }

//   void _loadLocale() {
//     final langCode = CacheHelper.getString('languageCode', defaultValue: 'en');
//     add(ChangeLocale(langCode));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/core/database/cache/cache_helper.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(locale: Locale('en'))) {
    on<ChangeLocale>((event, emit) async {
      await CacheHelper.setString('languageCode', event.languageCode);
      emit(LocaleState(locale: Locale(event.languageCode)));
    });

    _loadLocale(); // تحميل اللغة المحفوظة
  }

  void _loadLocale() {
    final savedLangCode = CacheHelper.getString('languageCode', defaultValue: 'en');
    add(ChangeLocale(savedLangCode));
  }
}