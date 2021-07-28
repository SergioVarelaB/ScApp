import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static final String TOKEN_KEY = "ACCES_TOKEN_KEY";

  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getString(String key, {String defaultVal = ""}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultVal;
  }

  static Future<String> getToken() {
    return getString(TOKEN_KEY);
  }

  static Future<void> setToken(String token) async {
    await setString(TOKEN_KEY, token);
  }
}