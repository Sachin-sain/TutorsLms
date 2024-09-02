import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

class CategoryResponse {
  List<CourseCategory>? courses;
  int? totalPages;
  int? coursesCount;

  CategoryResponse({
    this.courses,
    this.totalPages,
    this.coursesCount,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    courses: json["courses"] == null ? [] : List<CourseCategory>.from(json["courses"]!.map((x) => CourseCategory.fromJson(x))),
    totalPages: json["totalPages"],
    coursesCount: json["coursesCount"],
  );


}

class CourseCategory {
  int? courseId;
  String? title;
  String? slug;
  String? image;
  bool? inHomePage;
  String? shortDesc;
  DateTime? createdAt;
  User? user;
  List<dynamic>? enrolments;
  Category? category;
  List<Video>? videos;

  CourseCategory({
    this.courseId,
    this.title,
    this.slug,
    this.image,
    this.inHomePage,
    this.shortDesc,
    this.createdAt,
    this.user,
    this.enrolments,
    this.category,
    this.videos,
  });

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
    courseId: json["course_id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    inHomePage: json["in_home_page"],
    shortDesc: json["short_desc"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    enrolments: json["enrolments"] == null ? [] : List<dynamic>.from(json["enrolments"]!.map((x) => x)),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
  );

}

class Category {
  int? id;
  String? name;
  String? image;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );


}


class User {
  String? firstName;
  String? lastName;
  String? profilePhoto;

  User({
    this.firstName,
    this.lastName,
    this.profilePhoto,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePhoto: json["profile_photo"],
  );


}

class Video {
  int? videoId;

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
