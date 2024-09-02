
import 'dart:convert';

AllCourseResponse allCourseResponseFromJson(String str) => AllCourseResponse.fromJson(json.decode(str));

String allCourseResponseToJson(AllCourseResponse data) => json.encode(data.toJson());

class AllCourseResponse {
  final List<Course>? courses;
  final int? totalPages;
  final int? coursesCount;

  AllCourseResponse({
    this.courses,
    this.totalPages,
    this.coursesCount,
  });

  factory AllCourseResponse.fromJson(Map<String, dynamic> json) => AllCourseResponse(
    courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
    totalPages: json["totalPages"],
    coursesCount: json["coursesCount"],
  );

  Map<String, dynamic> toJson() => {
    "courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toJson())),
    "totalPages": totalPages,
    "coursesCount": coursesCount,
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
  final User? user;
  final List<Enrolment>? enrolments;
  final AllCourseCategory? category;
  final List<Video>? videos;

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseId: json["course_id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    inHomePage: json["in_home_page"],
    shortDesc: json["short_desc"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    enrolments: json["enrolments"] == null ? [] : List<Enrolment>.from(json["enrolments"]!.map((x) => Enrolment.fromJson(x))),
    category: json["category"] == null ? null : AllCourseCategory.fromJson(json["category"]),
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
    "user": user?.toJson(),
    "enrolments": enrolments == null ? [] : List<dynamic>.from(enrolments!.map((x) => x.toJson())),
    "category": category?.toJson(),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class AllCourseCategory {
  final int? id;
  final String? name;
  final String? image;
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AllCourseCategory({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory AllCourseCategory.fromJson(Map<String, dynamic> json) => AllCourseCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "slug": slug,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Enrolment {
  final int? id;

  Enrolment({
    this.id,
  });

  factory Enrolment.fromJson(Map<String, dynamic> json) => Enrolment(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class User {
  final String? firstName;
  final String? lastName;
  final String? profilePhoto;

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

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "profile_photo": profilePhoto,
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