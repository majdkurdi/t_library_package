import 'dart:convert';
import './user.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class AuthResponse {
  AuthResponse({
    required this.user,
    required this.token,
  });

  User user;
  final String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"] as Map<String, dynamic>),
        token: json["token"] as String,
      );
}
