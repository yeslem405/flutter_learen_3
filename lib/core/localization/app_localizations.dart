import 'dart:convert';                        // لتحويل JSON إلى Map
import 'package:flutter/material.dart';       // للوصول لـ Locale و BuildContext
import 'package:flutter/services.dart';       // لقراءة الملفات من assets

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // وسيلة سهلة للوصول إلى الترجمة من خلال: AppLocalizations.of(context)
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // المسؤول عن تحميل الترجمة المناسبة حسب اللغة
  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // تحميل الملف المناسب حسب الكود (ar/en)
    final jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    // تحويل نص JSON إلى Map
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // نحول القيم إلى String فقط
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  // دالة تستخدم في كل مكان لجلب الترجمة
  String translate(String key) {
    return _localizedStrings[key] ?? key; // إذا ما وجد المفتاح يرجع نفسه
  }

  // لتسجيل ال delegate في التطبيق
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  // اللغات المدعومة
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}