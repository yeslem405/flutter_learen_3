import 'package:flutter/widgets.dart';
import 'app_localizations.dart';

extension TranslateExtension on BuildContext {
  String tr(String key) => AppLocalizations.of(this).translate(key);
}