
import 'dart:convert';
String loginReuestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String email;
  String password;
  String token;

  LoginRequest({
    required this.email,
    required this.password,
    required this.token
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "token" : token
  };
}
