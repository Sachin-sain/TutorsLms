

import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));
class ForgotPasswordResponse {
  String message;

  ForgotPasswordResponse({
    required this.message,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
    message: json["message"],
  );

}
