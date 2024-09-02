import 'dart:convert';

PopularCourseResponse popularCourseResponseFromJson(String str) => PopularCourseResponse.fromJson(json.decode(str));


class PopularCourseResponse {
  final List<Course>? courses;
  final int? totalPages;
  final int? coursesCount;

  PopularCourseResponse({
    this.courses,
    this.totalPages,
    this.coursesCount,
  });

  factory PopularCourseResponse.fromJson(Map<String, dynamic> json) => PopularCourseResponse(
    courses: json["courses"] == null ? [] : List<Course>.from(json["courses"]!.map((x) => Course.fromJson(x))),
    totalPages: json["totalPages"],
    coursesCount: json["coursesCount"],
  );


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
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
  );

}

class Category {
  final int? id;
  final String? name;
  final String? image;
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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

class Enrolment {
  final int? id;

  Enrolment({
    this.id,
  });

  factory Enrolment.fromJson(Map<String, dynamic> json) => Enrolment(
    id: json["id"],
  );

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

}



class Video {
  final int? videoId;

  Video({
    this.videoId,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoId: json["video_id"],
  );

}

