import 'dart:convert';

String promoCodeRequestToJson(PromoCodeRequest data) => json.encode(data.toJson());

class PromoCodeRequest {
  String? promoCode;

  PromoCodeRequest({
    this.promoCode,
  });


  Map<String, dynamic> toJson() => {
    "promocode": promoCode,
  };
}
