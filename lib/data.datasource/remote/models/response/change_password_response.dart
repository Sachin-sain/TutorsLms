
import 'dart:convert';

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));
class ChangePasswordResponse {
  String message;
  ChangePasswordResponse({
    required this.message,
  });
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => ChangePasswordResponse(
    message: json["message"],
  );
}
