// To parse this JSON data, do
//
//     final categeriesResponse = categeriesResponseFromJson(jsonString);

import 'dart:convert';

CategeriesResponse categeriesResponseFromJson(String str) => CategeriesResponse.fromJson(json.decode(str));

String categeriesResponseToJson(CategeriesResponse data) => json.encode(data.toJson());

class CategeriesResponse {
  List<Category> categories;

  CategeriesResponse({
    required this.categories,
  });

  factory CategeriesResponse.fromJson(Map<String, dynamic> json) => CategeriesResponse(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
