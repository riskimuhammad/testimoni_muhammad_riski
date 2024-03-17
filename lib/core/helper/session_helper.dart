import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static setSessionLanguages(ln) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('languagesKey', ln);
  }

  static Future<String?> getGessionLanguages() async {
    final pref = await SharedPreferences.getInstance();
    final ln = await pref.getString('languagesKey');
    return ln;
  }
}
