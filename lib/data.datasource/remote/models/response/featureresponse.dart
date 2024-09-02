
import 'dart:convert';
FeatureResponse featureResponseFromJson(String str) => FeatureResponse.fromJson(json.decode(str));
String featureResponseToJson(FeatureResponse data) => json.encode(data.toJson());
class FeatureResponse {
  final List<Course>? courses;
  FeatureResponse({
    this.courses,
  });
  factory FeatureResponse.fromJson(Map<String, dynamic> json) => FeatureResponse(
    courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toJson())),
  };
}

class Course {
  final int? courseId;
  final String? title;
  final String? slug;
  final String? image;
  final bool? inHomePage;
  final String? shortDesc;
  final DateTime? createdAt;
  final Category? category;
  final List<Video>? videos;

  Course({
    this.courseId,
    this.title,
    this.slug,
    this.image,
    this.inHomePage,
    this.shortDesc,
    this.createdAt,
    this.category,
    this.videos,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["course_id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    inHomePage: json["in_home_page"],
    shortDesc: json["short_desc"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course_id": courseId,
    "title": title,
    "slug": slug,
    "image": image,
    "in_home_page": inHomePage,
    "short_desc": shortDesc,
    "created_at": createdAt?.toIso8601String(),
    "category": category?.toJson(),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class Category {
  final String? name;
  final String? slug;

  Category({
    this.name,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
  };
}

class Video {
  final int? videoId;

  Video({
    this.videoId,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoId: json["video_id"],
  );

  Map<String, dynamic> toJson() => {
    "video_id": videoId,
  };
}
