import 'dart:convert';

String googleLoginRequestToJson(GoogleLoginRequest data) => json.encode(data.toJson());

class GoogleLoginRequest {
  String token;
  String type;


  GoogleLoginRequest({
    required this.token,
    required this.type
  });

  Map<String, dynamic> toJson() => {
    "token": token,
    "type" : type

  };
}