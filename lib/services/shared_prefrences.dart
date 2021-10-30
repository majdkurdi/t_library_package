import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/auth_response.dart';

Future<void> rememberUser(AuthResponse user) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('email', user.user.email);
  pref.setString('phoneNumber', user.user.phoneNumber);
  pref.setString('name', user.user.name);
  pref.setString('address', user.user.address);
  pref.setInt('id', user.user.id);
  pref.setString('token', user.token);
}

Future<AuthResponse?> getSavedUser() async {
  final pref = await SharedPreferences.getInstance();
  if (pref.getString('email') == null) return null;
  return AuthResponse(
      user: User(
          name: pref.getString('name') ?? '',
          email: pref.getString('email') ?? '',
          phoneNumber: pref.getString('phoneNumber') ?? '',
          address: pref.getString('address') ?? '',
          id: pref.getInt('id') ?? -1),
      token: pref.getString('token') ?? '');
}

Future<void> clearUser() async {
  final pref = await SharedPreferences.getInstance();
  pref.clear();
}

Future<bool> isLoggedIn() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString('token') != null;
}
