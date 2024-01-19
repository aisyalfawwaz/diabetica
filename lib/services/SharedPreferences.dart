import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveSession(String userId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('user_id', userId);
}
