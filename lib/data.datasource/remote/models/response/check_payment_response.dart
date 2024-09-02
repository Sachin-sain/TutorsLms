import 'dart:convert';

CheckPayment checkPaymentFromJson(String str) => CheckPayment.fromJson(json.decode(str));


class CheckPayment {
  String? status;
  String? message;
  String? orderId;

  CheckPayment({
    this.status,
    this.message,
    this.orderId,
  });

  factory CheckPayment.fromJson(Map<String, dynamic> json) => CheckPayment(
    status: json["status"],
    message: json["message"],
    orderId: json["order_id"],
  );

}
