import 'dart:convert';

PromoCodeResponse promoCodeResponseFromJson(String str) => PromoCodeResponse.fromJson(json.decode(str));

class PromoCodeResponse {
  String? message;

  PromoCodeResponse({
    this.message,
  });

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) => PromoCodeResponse(
    message: json["message"],
  );


}
