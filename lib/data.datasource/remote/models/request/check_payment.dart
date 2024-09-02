import 'dart:convert';


String checkPaymentToJson(CheckPayment data) => json.encode(data.toJson());

class CheckPayment {
  String? paymentIntent;
  String? country;

  CheckPayment({
    this.paymentIntent,
    this.country,
  });

  Map<String, dynamic> toJson() => {
    "payment_intent": paymentIntent,
    "country": country,
  };
}
