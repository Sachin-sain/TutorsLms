
import 'dart:convert';
RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));
class RegisterResponse {
  String message;
  String elarnivUsersToken;

  RegisterResponse({
    required this.message,
    required this.elarnivUsersToken,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    message: json["message"],
    elarnivUsersToken: json["token"],
  );
}
