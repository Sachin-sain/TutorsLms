import 'dart:convert';
String createPaymentRequestToJson(CreatePaymentRequest data) => json.encode(data.toJson());

class CreatePaymentRequest {
  String id;


  CreatePaymentRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    "package_id": id,

  };
}

String CheckPaymentRequestToJson(CreatePaymentRequest data) => json.encode(data.toJson());

class CheckPaymentRequest {
  String paymentIntent;
  String country;


  CheckPaymentRequest({
    required this.paymentIntent,
    required this.country
  });

  Map<String, dynamic> toJson() => {
    "payment_intent": paymentIntent,
    "country" : country

  };
}