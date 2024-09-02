
import 'dart:convert';

PurchaseHistory purchaseHistoryFromJson(String str) => PurchaseHistory.fromJson(json.decode(str));


class PurchaseHistory {
  List<Enrolment>? enrolments;

  PurchaseHistory({
    this.enrolments,
  });

  factory PurchaseHistory.fromJson(Map<String, dynamic> json) => PurchaseHistory(
    enrolments: json["enrolments"] == null ? [] : List<Enrolment>.from(json["enrolments"]!.map((x) => Enrolment.fromJson(x))),
  );


}

class Enrolment {
  int? id;
  String? orderId;
  int? userId;
  int? packageId;
  String? boughtPrice;
  int? attachedId;
  String? paymentMethod;
  int? status;
  String? paymentStatus;
  String? reason;
  String? comment;
  DateTime? expiredAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Package? package;

  Enrolment({
    this.id,
    this.orderId,
    this.userId,
    this.packageId,
    this.boughtPrice,
    this.attachedId,
    this.paymentMethod,
    this.status,
    this.paymentStatus,
    this.reason,
    this.comment,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    this.package,
  });

  factory Enrolment.fromJson(Map<String, dynamic> json) => Enrolment(
    id: json["id"],
    orderId: json["order_id"],
    userId: json["user_id"],
    packageId: json["package_id"],
    boughtPrice: json["bought_price"],
    attachedId: json["attached_id"],
    paymentMethod: json["payment_method"],
    status: json["status"],
    paymentStatus: json["payment_status"],
    reason: json["reason"],
    comment: json["comment"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    package: json["package"] == null ? null : Package.fromJson(json["package"]),
  );

}

class Package {
  String? name;
  String? price;
  String? description;
  String? type;

  Package({
    this.name,
    this.price,
    this.description,
    this.type,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    name: json["name"],
    price: json["price"],
    description: json["description"],
    type: json["type"],
  );

}

