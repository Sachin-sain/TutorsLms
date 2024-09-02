// To parse this JSON data, do
//
//     final learningResponse = learningResponseFromJson(jsonString);

import 'dart:convert';

LearningResponse learningResponseFromJson(String str) => LearningResponse.fromJson(json.decode(str));

String learningResponseToJson(LearningResponse data) => json.encode(data.toJson());

class LearningResponse {
  List<Enrolment> enrolments;

  LearningResponse({
    required this.enrolments,
  });

  factory LearningResponse.fromJson(Map<String, dynamic> json) => LearningResponse(
    enrolments: List<Enrolment>.from(json["enrolments"].map((x) => Enrolment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "enrolments": List<dynamic>.from(enrolments.map((x) => x.toJson())),
  };
}

class Enrolment {
  int id;
  int userId;
  int courseId;
  int courseStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Course course;

  Enrolment({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.courseStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.course,
  });

  factory Enrolment.fromJson(Map<String, dynamic> json) => Enrolment(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    courseStatus: json["course_status"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    course: Course.fromJson(json["course"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "courseId": courseId,
    "course_status": courseStatus,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "course": course.toJson(),
  };
}

class Course {
  int id;
  String title;
  String slug;
  String image;
  bool isClass;
  String shortDesc;
  User user;
  List<CourseProgress> courseProgresses;
  List<Video> videos;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.isClass,
    required this.shortDesc,
    required this.user,
    required this.courseProgresses,
    required this.videos,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    isClass: json["is_class"],
    shortDesc: json["short_desc"],
    user: User.fromJson(json["user"]),
    courseProgresses: List<CourseProgress>.from(json["course_progresses"].map((x) => CourseProgress.fromJson(x))),
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "image": image,
    "is_class": isClass,
    "short_desc": shortDesc,
    "user": user.toJson(),
    "course_progresses": List<dynamic>.from(courseProgresses.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
  };
}

class CourseProgress {
  int id;
  bool finished;
  int userId;
  int courseId;
  int videoId;
  DateTime createdAt;
  DateTime updatedAt;

  CourseProgress({
    required this.id,
    required this.finished,
    required this.userId,
    required this.courseId,
    required this.videoId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseProgress.fromJson(Map<String, dynamic> json) => CourseProgress(
    id: json["id"],
    finished: json["finished"],
    userId: json["userId"],
    courseId: json["courseId"],
    videoId: json["videoId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "finished": finished,
    "userId": userId,
    "courseId": courseId,
    "videoId": videoId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  String firstName;
  String lastName;
  String profilePhoto;

  User({
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
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
  int id;
  String groupName;
  String title;
  String thumb;
  String video;
  double videoLength;
  bool isPreview;
  int shortId;
  dynamic assetsZip;
  int userId;
  int courseId;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  Video({
    required this.id,
    required this.groupName,
    required this.title,
    required this.thumb,
    required this.video,
    required this.videoLength,
    required this.isPreview,
    required this.shortId,
    required this.assetsZip,
    required this.userId,
    required this.courseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    groupName: json["group_name"],
    title: json["title"],
    thumb: json["thumb"],
    video: json["video"],
    videoLength: json["video_length"]?.toDouble(),
    isPreview: json["is_preview"],
    shortId: json["short_id"],
    assetsZip: json["assets_zip"],
    userId: json["userId"],
    courseId: json["courseId"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_name": groupName,
    "title": title,
    "thumb": thumb,
    "video": video,
    "video_length": videoLength,
    "is_preview": isPreview,
    "short_id": shortId,
    "assets_zip": assetsZip,
    "userId": userId,
    "courseId": courseId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
