import 'dart:convert';

SingleCourseResponse singleCourseResponseFromJson(String str) => SingleCourseResponse.fromJson(json.decode(str));


class SingleCourseResponse {
  final Course? course;

  SingleCourseResponse({
    this.course,
  });

  factory SingleCourseResponse.fromJson(Map<String, dynamic> json) => SingleCourseResponse(
    course: json["course"] == null ? null : Course.fromJson(json["course"]),
  );

}

class Course {
  final int? id;
  final String? title;
  final String? slug;
  final String? shortDesc;
  final String? overview;
  final String? duration;
  final String? image;
  final String? requirements;
  final String? whatYouWillLearn;
  final String? whoIsThisCourseFor;
  final int? userId;
  final int? catId;
  final bool? approved;
  final bool? status;
  final bool? inHomePage;
  final String? inHomePageSetAt;
  final bool? isClass;
  final String? createdAt;
  final String? updatedAt;
  final User? user;
  final Category? category;
  final List<dynamic>? enrolments;
  final List<Video>? videos;

  Course({
    this.id,
    this.title,
    this.slug,
    this.shortDesc,
    this.overview,
    this.duration,
    this.image,
    this.requirements,
    this.whatYouWillLearn,
    this.whoIsThisCourseFor,
    this.userId,
    this.catId,
    this.approved,
    this.status,
    this.inHomePage,
    this.inHomePageSetAt,
    this.isClass,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.category,
    this.enrolments,
    this.videos,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    shortDesc: json["short_desc"],
    overview: json["overview"],
    duration: json["duration"],
    image: json["image"],
    requirements: json["requirements"],
    whatYouWillLearn: json["what_you_will_learn"],
    whoIsThisCourseFor: json["who_is_this_course_for"],
    userId: json["userId"],
    catId: json["catId"],
    approved: json["approved"],
    status: json["status"],
    inHomePage: json["in_home_page"],
    inHomePageSetAt: json["in_home_page_set_at"],
    isClass: json["is_class"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    enrolments: json["enrolments"] == null ? [] : List<dynamic>.from(json["enrolments"]!.map((x) => x)),
    videos: json["videos"] == null ? [] : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
  );

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

class User {
  final String? firstName;
  final String? lastName;
  final String? profilePhoto;
  final String? bio;

  User({
    this.firstName,
    this.lastName,
    this.profilePhoto,
    this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePhoto: json["profile_photo"],
    bio: json["bio"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "profile_photo": profilePhoto,
    "bio": bio,
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

}


