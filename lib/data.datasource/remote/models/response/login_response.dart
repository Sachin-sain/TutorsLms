// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
class LoginResponse {
  String message;
  String elarnivUsersToken;

  LoginResponse({
    required this.message,
    required this.elarnivUsersToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    elarnivUsersToken: json["token"],
  );

}
