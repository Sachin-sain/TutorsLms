// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  final Courses? courses;
  final List<Recent>? recent;
  final Membership? membership;

  DashboardResponse({
    this.courses,
    this.recent,
    this.membership,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
    courses: json["courses"] == null ? null : Courses.fromJson(json["courses"]),
    recent: json["recent"] == null ? [] : List<Recent>.from(json["recent"]!.map((x) => Recent.fromJson(x))),
    membership: json["membership"] == null ? null : Membership.fromJson(json["membership"]),
  );

  Map<String, dynamic> toJson() => {
    "courses": courses?.toJson(),
    "recent": recent == null ? [] : List<dynamic>.from(recent!.map((x) => x.toJson())),
    "membership": membership?.toJson(),
  };
}

class Courses {
  final int? totalEnroll;
  final String? courseCompleted;
  final String? coursePending;

  Courses({
    this.totalEnroll,
    this.courseCompleted,
    this.coursePending,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    totalEnroll: json["total_enroll"],
    courseCompleted: json["course_completed"],
    coursePending: json["course_pending"],
  );

  Map<String, dynamic> toJson() => {
    "total_enroll": totalEnroll,
    "course_completed": courseCompleted,
    "course_pending": coursePending,
  };
}

class Membership {
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

  Membership({
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

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "user_id": userId,
    "package_id": packageId,
    "bought_price": boughtPrice,
    "attached_id": attachedId,
    "payment_method": paymentMethod,
    "status": status,
    "st_pay_status": stPayStatus,
    "reason": reason,
    "client_response": clientResponse,
    "expired_at": expiredAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "package": package?.toJson(),
  };
}

class Package {
  final String? name;
  final String? price;
  final String? description;
  final String? type;

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

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "description": description,
    "type": type,
  };
}

class Recent {
  final int? id;
  final int? userId;
  final int? courseId;
  final int? videoId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Course? course;
  final Video? video;

  Recent({
    this.id,
    this.userId,
    this.courseId,
    this.videoId,
    this.createdAt,
    this.updatedAt,
    this.course,
    this.video,
  });

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    videoId: json["videoId"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    course: json["course"] == null ? null : Course.fromJson(json["course"]),
    video: json["video"] == null ? null : Video.fromJson(json["video"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "courseId": courseId,
    "videoId": videoId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "course": course?.toJson(),
    "video": video?.toJson(),
  };
}

class Course {
  final int? id;
  final String? slug;
  final String? shortDesc;
  final String? title;
  final String? image;

  Course({
    this.id,
    this.slug,
    this.shortDesc,
    this.title,
    this.image,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    slug: json["slug"],
    shortDesc: json["short_desc"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "short_desc": shortDesc,
    "title": title,
    "image": image,
  };
}

class Video {
  final int? id;
  final String? thumb;
  final String? title;
  final String? groupName;

  Video({
    this.id,
    this.thumb,
    this.title,
    this.groupName,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    thumb: json["thumb"],
    title: json["title"],
    groupName: json["group_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "thumb": thumb,
    "title": title,
    "group_name": groupName,
  };
}
