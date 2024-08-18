import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs;

  // save token
  static Future<void> saveUid(String uid) async {
    await _prefs.setString('uid', uid);
  }

  static Future<String> getUid() async {
    return _prefs.getString('uid') ?? '';
  }

  static Future<bool> deleteUid() async {
    return _prefs.clear();
  }
}
