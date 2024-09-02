import 'dart:convert';

VideoResponse videoResponseFromJson(String str) => VideoResponse.fromJson(json.decode(str));


class VideoResponse {
  final Video? video;

  VideoResponse({
    this.video,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
    video: json["video"] == null ? null : Video.fromJson(json["video"]),
  );

}

class Video {
  final int? id;
  final String? groupName;
  final String? title;
  final String? thumb;
  final String? video;
  final dynamic videoLength;
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
    videoLength: json["video_length"],
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
