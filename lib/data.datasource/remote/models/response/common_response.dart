import 'dart:convert';

CommonResponse commonResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

class CommonResponse {
  String? message;

  CommonResponse({
     this.message,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
    message: json["message"],
  );


}
