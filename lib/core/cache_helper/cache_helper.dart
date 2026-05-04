import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@lazySingleton
class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);

  // ─── Setters ───────────────────────────────────────────────

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<bool> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);

  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);

  Future<bool> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  // ─── Getters ───────────────────────────────────────────────

  String? getString(String key) => _prefs.getString(key);

  int? getInt(String key) => _prefs.getInt(key);

  double? getDouble(String key) => _prefs.getDouble(key);

  bool? getBool(String key) => _prefs.getBool(key);

  List<String>? getStringList(String key) => _prefs.getStringList(key);

  /// Get any type with a fallback default value
  T getData<T>(String key, T defaultValue) {
    final value = _prefs.get(key);
    return (value is T) ? value : defaultValue;
  }

  // ─── Utility ───────────────────────────────────────────────

  bool containsKey(String key) => _prefs.containsKey(key);

  Future<bool> remove(String key) => _prefs.remove(key);

  Future<bool> clearAll() => _prefs.clear();
}