import 'dart:convert';

LearningResponse learningResponseFromJson(String str) => LearningResponse.fromJson(json.decode(str));


class LearningResponse {
  final List<Enrolment>? enrolments;

  LearningResponse({
    this.enrolments,
  });

  factory LearningResponse.fromJson(Map<String, dynamic> json) => LearningResponse(
    enrolments: json["enrolments"] == null ? [] : List<Enrolment>.from(json["enrolments"]!.map((x) => Enrolment.fromJson(x))),
  );

}

class Enrolment {
  final int? id;
  final int? userId;
  final int? courseId;
  final int? courseStatus;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Course? course;

  Enrolment({
    this.id,
    this.userId,
    this.courseId,
    this.courseStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.course,
  });

  factory Enrolment.fromJson(Map<String, dynamic> json) => Enrolment(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    courseStatus: json["course_status"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    course: json["course"] == null ? null : Course.fromJson(json["course"]),
  );

}

class Course {
  final int? id;
  final String? title;
  final String? slug;
  final String? image;
  final bool? isClass;
  final String? shortDesc;
  final User? user;
  final List<CourseProgress>? courseProgresses;
  final List<Video>? videos;

  Course({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.isClass,
    this.shortDesc,
    this.user,
    this.courseProgresses,
    this.videos,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    isClass: json["is_class"],
    shortDesc: json["short_desc"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    courseProgresses: json["course_progresses"] == null ? [] : List<CourseProgress>.from(json["course_progresses"]!.map((x) => CourseProgress.fromJson(x))),
    videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "image": image,
    "is_class": isClass,
    "short_desc": shortDesc,
    "user": user?.toJson(),
    "course_progresses": courseProgresses == null ? [] : List<dynamic>.from(courseProgresses!.map((x) => x.toJson())),
    "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x.toJson())),
  };
}

class CourseProgress {
  final int? id;
  final bool? finished;
  final int? userId;
  final int? courseId;
  final int? videoId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CourseProgress({
    this.id,
    this.finished,
    this.userId,
    this.courseId,
    this.videoId,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseProgress.fromJson(Map<String, dynamic> json) => CourseProgress(
    id: json["id"],
    finished: json["finished"],
    userId: json["userId"],
    courseId: json["courseId"],
    videoId: json["videoId"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "finished": finished,
    "userId": userId,
    "courseId": courseId,
    "videoId": videoId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
  final int? id;
  final String? groupName;
  final String? title;
  final String? thumb;
  final String? video;
  final double? videoLength;
  final bool? isPreview;
  final int? shortId;
  final dynamic assetsZip;
  final int? userId;
  final int? courseId;
  final bool? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Video({
    this.id,
    this.groupName,
    this.title,
    this.thumb,
    this.video,
    this.videoLength,
    this.isPreview,
    this.shortId,
    this.assetsZip,
    this.userId,
    this.courseId,
    this.status,
    this.createdAt,
    this.updatedAt,
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
