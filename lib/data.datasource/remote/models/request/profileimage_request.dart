// To parse this JSON data, do
//
//     final profileimageRequest = profileimageRequestFromJson(jsonString);

import 'dart:convert';

ProfileimageRequest profileimageRequestFromJson(String str) => ProfileimageRequest.fromJson(json.decode(str));

String profileimageRequestToJson(ProfileimageRequest data) => json.encode(data.toJson());

class ProfileimageRequest {
  final String? profilePhoto;

  ProfileimageRequest({
    this.profilePhoto,
  });

  factory ProfileimageRequest.fromJson(Map<String, dynamic> json) => ProfileimageRequest(
    profilePhoto: json["profile_photo"],
  );

  Map<String, dynamic> toJson() => {
    "profile_photo": profilePhoto,
  };
}
