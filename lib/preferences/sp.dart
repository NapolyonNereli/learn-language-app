

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSP {
  static SharedPreferences? _instance;

  static SharedPreferences get instance => _instance!;

  static Future<SharedPreferences> init() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

} 