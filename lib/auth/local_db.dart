import 'package:shared_preferences/shared_preferences.dart';

class DbClient {
  setData({required String dbKey, required var value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(dbKey, value);
  }

  getData({required String dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(dbKey);
    return result;
  }

  removeData({required String dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(dbKey);
  }

  reset() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
