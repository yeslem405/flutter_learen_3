import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  // تهيئة SharedPreferences (استدعِها في main قبل تشغيل التطبيق)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // حفظ قيمة bool
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // جلب قيمة bool
  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  // حفظ قيمة String
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // جلب قيمة String
  static String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  // حذف قيمة
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }
}