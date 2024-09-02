import 'dart:convert';

EnrolledPlanResponse enrolledPlanResponseFromJson(String str) => EnrolledPlanResponse.fromJson(json.decode(str));


class EnrolledPlanResponse {
  final Plan? plan;
  final UserPlan? userPlan;

  EnrolledPlanResponse({
    this.plan,
    this.userPlan,
  });

  factory EnrolledPlanResponse.fromJson(Map<String, dynamic> json) => EnrolledPlanResponse(
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    userPlan: json["userPlan"] == null ? null : UserPlan.fromJson(json["userPlan"]),
  );

}

class Plan {
  final int? allEnrolls;
  final int? enroll;

  Plan({
    this.allEnrolls,
    this.enroll,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    allEnrolls: json["all_enrolls"],
    enroll: json["enroll"],
  );

  Map<String, dynamic> toJson() => {
    "all_enrolls": allEnrolls,
    "enroll": enroll,
  };
}

class UserPlan {
  final int? id;
  final String? orderId;
  final int? userId;
  final int? packageId;
  final String? boughtPrice;
  final dynamic attachedId;
  final String? paymentMethod;
  final int? status;
  final String? stPayStatus;
  final dynamic reason;
  final dynamic clientResponse;
  final DateTime? expiredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Package? package;

  UserPlan({
    this.id,
    this.orderId,
    this.userId,
    this.packageId,
    this.boughtPrice,
    this.attachedId,
    this.paymentMethod,
    this.status,
    this.stPayStatus,
    this.reason,
    this.clientResponse,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    this.package,
  });

  factory UserPlan.fromJson(Map<String, dynamic> json) => UserPlan(
    id: json["id"],
    orderId: json["order_id"],
    userId: json["user_id"],
    packageId: json["package_id"],
    boughtPrice: json["bought_price"],
    attachedId: json["attached_id"],
    paymentMethod: json["payment_method"],
    status: json["status"],
    stPayStatus: json["st_pay_status"],
    reason: json["reason"],
    clientResponse: json["client_response"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    package: json["package"] == null ? null : Package.fromJson(json["package"]),
  );

}

class Package {
  final int? id;
  final String? name;
  final int? totalCourses;
  final String? price;
  final String? description;
  final String? currency;
  final String? type;

  Package({
    this.id,
    this.name,
    this.totalCourses,
    this.price,
    this.description,
    this.currency,
    this.type,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    name: json["name"],
    totalCourses: json["total_courses"],
    price: json["price"],
    description: json["description"],
    currency: json["currency"],
    type: json["type"],
  );

}
