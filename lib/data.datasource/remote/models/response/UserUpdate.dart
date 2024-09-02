// To parse this JSON data, do
//
//     final userUpdate = userUpdateFromJson(jsonString);

import 'dart:convert';

UserUpdate userUpdateFromJson(String str) => UserUpdate.fromJson(json.decode(str));


class UserUpdate {
  final UserDetails? user;

  UserUpdate({
    this.user,
  });

  factory UserUpdate.fromJson(Map<String, dynamic> json) => UserUpdate(
    user: json["user"] == null ? null : UserDetails.fromJson(json["user"]),
  );

}

class UserDetails {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final dynamic muid;
  final String? gender;
  final dynamic designation;
  final String? bio;
  final dynamic profilePhoto;
  final dynamic location;
  final dynamic phone;
  final int? resetPasswordToken;
  final DateTime? resetPasswordSendAt;
  final dynamic resetPasswordAt;
  final String? website;
  final String? twitter;
  final String? facebook;
  final String? linkedin;
  final String? youtube;
  final String? role;
  final bool? emailConfirmed;
  final dynamic emailConfirmedAt;
  final bool? instructorRequest;
  final bool? instructorRequestConfirmed;
  final dynamic instructorRequestConfirmedAt;
  final dynamic instructorStatus;
  final dynamic instructorSubject;
  final dynamic instructorDescription;
  final bool? status;
  final bool? isProfilePublic;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.muid,
    this.gender,
    this.designation,
    this.bio,
    this.profilePhoto,
    this.location,
    this.phone,
    this.resetPasswordToken,
    this.resetPasswordSendAt,
    this.resetPasswordAt,
    this.website,
    this.twitter,
    this.facebook,
    this.linkedin,
    this.youtube,
    this.role,
    this.emailConfirmed,
    this.emailConfirmedAt,
    this.instructorRequest,
    this.instructorRequestConfirmed,
    this.instructorRequestConfirmedAt,
    this.instructorStatus,
    this.instructorSubject,
    this.instructorDescription,
    this.status,
    this.isProfilePublic,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    muid: json["muid"],
    gender: json["gender"],
    designation: json["designation"],
    bio: json["bio"],
    profilePhoto: json["profile_photo"],
    location: json["location"],
    phone: json["phone"],
    resetPasswordToken: json["reset_password_token"],
    resetPasswordSendAt: json["reset_password_send_at"] == null ? null : DateTime.parse(json["reset_password_send_at"]),
    resetPasswordAt: json["reset_password_at"],
    website: json["website"],
    twitter: json["twitter"],
    facebook: json["facebook"],
    linkedin: json["linkedin"],
    youtube: json["youtube"],
    role: json["role"],
    emailConfirmed: json["email_confirmed"],
    emailConfirmedAt: json["email_confirmed_at"],
    instructorRequest: json["instructor_request"],
    instructorRequestConfirmed: json["instructor_request_confirmed"],
    instructorRequestConfirmedAt: json["instructor_request_confirmed_at"],
    instructorStatus: json["instructor_status"],
    instructorSubject: json["instructor_subject"],
    instructorDescription: json["instructor_description"],
    status: json["status"],
    isProfilePublic: json["is_profile_public"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

}
