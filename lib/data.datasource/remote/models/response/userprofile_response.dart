// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  String message;
  String elarnivUsersToken;

  ProfileResponse({
    required this.message,
    required this.elarnivUsersToken,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    message: json["message"],
    elarnivUsersToken: json["elarniv_users_token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "elarniv_users_token": elarnivUsersToken,
  };
}
