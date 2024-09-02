import 'dart:convert';

GoogleResponse googleResponseFromJson(String str) => GoogleResponse.fromJson(json.decode(str));

class GoogleResponse {
  String? message;
  String? token;

  GoogleResponse({
    this.message,
    this.token,
  });

  factory GoogleResponse.fromJson(Map<String, dynamic> json) => GoogleResponse(
    message: json["message"],
    token: json["token"],
  );

}
