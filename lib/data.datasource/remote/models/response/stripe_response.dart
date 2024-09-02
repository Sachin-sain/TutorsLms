import 'dart:convert';

StripeResponse stripeResponseFromJson(String str) => StripeResponse.fromJson(json.decode(str));


class StripeResponse {
  final String? type;
  final String? url;

  StripeResponse({
    this.type,
    this.url,
  });

  factory StripeResponse.fromJson(Map<String, dynamic> json) => StripeResponse(
    type: json["type"],
    url: json["url"],
  );

}
