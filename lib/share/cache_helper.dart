import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static getShared({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> setShared(
      {required String key, required dynamic value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> setInt(
      {required String key, required dynamic value}) async {
    return await sharedPreferences.setInt(key, value);
  }
}
