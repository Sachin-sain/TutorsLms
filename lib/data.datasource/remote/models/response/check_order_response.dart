import 'dart:convert';

CheckOrder checkOrderFromJson(String str) => CheckOrder.fromJson(json.decode(str));


class CheckOrder {
  String? status;
  String? message;
  String? orderId;

  CheckOrder({
    this.status,
    this.message,
    this.orderId,
  });

  factory CheckOrder.fromJson(Map<String, dynamic> json) => CheckOrder(
    status: json["status"],
    message: json["message"],
    orderId: json["order_id"],
  );

}
