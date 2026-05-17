import 'package:shared_preferences/shared_preferences.dart';

class Getname {
  static Future<String> me() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final firstname = prefs.getString('firstname') ?? '';
    return '$name $firstname'.trim();
  }

  static Future<int> id() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id') ?? 0;
  }
}
