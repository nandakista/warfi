import 'package:desktop_base/app/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences prefs = locator<SharedPreferences>();
class KeyPrefs {
  static const firstOpen = 'onboarding';
}

class SPrefs {
  static Future<void> logout() async {
    await prefs.clear();
    await prefs.setBool(KeyPrefs.firstOpen, false);
  }
}

