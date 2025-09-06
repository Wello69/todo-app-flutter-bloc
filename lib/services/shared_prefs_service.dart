import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class SharedPrefsService {
  static const String _userKey = 'current_user';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.email);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_userKey);
    return email != null ? User(email: email) : null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}