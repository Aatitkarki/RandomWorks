import 'package:shared_preferences/shared_preferences.dart';

class OfflineService {
  static savetoPrefs(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value);
  }

  static getFromPrefs(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }
}
