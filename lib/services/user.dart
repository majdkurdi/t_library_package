import 'dart:convert';

import './http_service.dart';
import '../models/user.dart';

class UserService {
  UserService._internal();

  static UserService? _instance;

  factory UserService() {
    if (_instance == null) {
      _instance = UserService._internal();
    }
    return _instance!;
  }

  Future<User?> updateUser(
      {required String name,
      required String address,
      required String phoneNumber}) async {
    try {
      final response = await post('/user/update', body: {
        "name": name,
        "phone_number": phoneNumber,
        "address": address
      });
      print(2);
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      print(3);
      print(responseBody);
      return User.fromJson(responseBody);
    } on Exception catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
