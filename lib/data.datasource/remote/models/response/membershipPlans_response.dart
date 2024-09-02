import 'dart:convert';

MembershipPlanResponse membershipPlanFromJson(String str) => MembershipPlanResponse.fromJson(json.decode(str));


class MembershipPlanResponse {
  final Plans? plans;

  MembershipPlanResponse({
    this.plans,
  });

  factory MembershipPlanResponse.fromJson(Map<String, dynamic> json) => MembershipPlanResponse(
    plans: json["plans"] == null ? null : Plans.fromJson(json["plans"]),
  );

}

class Plans {
  final List<Gold>? silver;
  final List<Gold>? platinum;
  final List<Gold>? gold;

  Plans({
    this.silver,
    this.platinum,
    this.gold,
  });

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
    silver: json["silver"] == null ? [] : List<Gold>.from(json["silver"]!.map((x) => Gold.fromJson(x))),
    platinum: json["platinum"] == null ? [] : List<Gold>.from(json["platinum"]!.map((x) => Gold.fromJson(x))),
    gold: json["gold"] == null ? [] : List<Gold>.from(json["gold"]!.map((x) => Gold.fromJson(x))),
  );

}

class Gold {
  final int? id;
  final String? name;
  final int? totalCourses;
  final String? price;
  final String? description;
  final String? currency;
  final String? type;

  Gold({
    this.id,
    this.name,
    this.totalCourses,
    this.price,
    this.description,
    this.currency,
    this.type,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
    id: json["id"],
    name: json["name"],
    totalCourses: json["total_courses"],
    price: json["price"],
    description: json["description"],
    currency: json["currency"],
    type: json["type"],
  );

}
