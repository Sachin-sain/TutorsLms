import 'dart:convert';

CreatePaymentResponse createPaymentResponseFromJson(String str) => CreatePaymentResponse.fromJson(json.decode(str));


class CreatePaymentResponse {
  String? message;
  PaymentData? data;

  CreatePaymentResponse({
    this.message,
    this.data,
  });

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) => CreatePaymentResponse(
    message: json["message"],
    data: json["data"] == null ? null : PaymentData.fromJson(json["data"]),
  );
  
}

class PaymentData {
  String? country;
  String? email;
  String? name;
  String? paymentIntent;
  int? amount;
  String? currency;
  String? clientSecret;

  PaymentData({
    this.country,
    this.email,
    this.name,
    this.paymentIntent,
    this.amount,
    this.currency,
    this.clientSecret,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
    country: json["country"],
    email: json["email"],
    name: json["name"],
    paymentIntent: json["paymentIntent"],
    amount: json["amount"],
    currency: json["currency"],
    clientSecret: json["clientSecret"],
  );
  
}
