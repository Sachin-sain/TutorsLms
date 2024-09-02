import 'dart:convert';

GetCourseDetail getCourseDetailFromJson(String str) => GetCourseDetail.fromJson(json.decode(str));

String getCourseDetailToJson(GetCourseDetail data) => json.encode(data.toJson());

class GetCourseDetail {
  Course course;
  List<Video> videos;

  GetCourseDetail({
    required this.course,
    required this.videos,
  });

  factory GetCourseDetail.fromJson(Map<String, dynamic> json) => GetCourseDetail(
    course: Course.fromJson(json["course"]),
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course.toJson(),
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
  };
}

class Course {
  int id;
  String title;
  String slug;
  String shortDesc;
  String overview;
  String duration;
  String image;
  String requirements;
  String whatYouWillLearn;
  String whoIsThisCourseFor;
  int userId;
  int catId;
  bool approved;
  bool status;
  bool inHomePage;
  dynamic inHomePageSetAt;
  bool isClass;
  DateTime createdAt;
  DateTime updatedAt;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.shortDesc,
    required this.overview,
    required this.duration,
    required this.image,
    required this.requirements,
    required this.whatYouWillLearn,
    required this.whoIsThisCourseFor,
    required this.userId,
    required this.catId,
    required this.approved,
    required this.status,
    required this.inHomePage,
    required this.inHomePageSetAt,
    required this.isClass,
    required this.createdAt,
    required this.updatedAt,
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "short_desc": shortDesc,
    "overview": overview,
    "duration": duration,
    "image": image,
    "requirements": requirements,
    "what_you_will_learn": whatYouWillLearn,
    "who_is_this_course_for": whoIsThisCourseFor,
    "userId": userId,
    "catId": catId,
    "approved": approved,
    "status": status,
    "in_home_page": inHomePage,
    "in_home_page_set_at": inHomePageSetAt,
    "is_class": isClass,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
