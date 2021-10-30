import 'dart:convert';

import 'package:http/http.dart' as http;
import './http_service.dart';
import '../models/auth_response.dart';
// import '../models/user.dart';

class Auth {
  Auth._internal();

  static Auth? _instance;

  factory Auth() {
    return _instance ??= Auth._internal();
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    required String address,
    required String phoneNumber,
  }) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/signup'), body: {
        "name": name,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "address": address
      });
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      print(responseBody);
      return responseBody['name'] != null;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future verify(String verficationCode) async {
    try {
      final response =
          await post('/verify', body: {'verified_code': verficationCode});
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<AuthResponse?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/login'),
          body: {"email": email, "password": password});
      print(response.body);
      if (jsonDecode(response.body) == 'Wrong Credentials') return null;
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      print(responseBody);
      return AuthResponse.fromJson(responseBody);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await get('/logout');
      print('logged out!');
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      final response = await post('/resetPassowrd', body: {'email': '$email'});
      print(response.body);
      return ((jsonDecode(response.body) as Map<String, dynamic>)['success']
          as bool);
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> doResetPassword(String code, String newPassword) async {
    try {
      final response = await post('/doReset',
          body: {"verified_code": code, "new_password": "magdngngsy"});
      print(response.body);
      return ((jsonDecode(response.body) as Map<String, dynamic>)['success']
          as bool);
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
