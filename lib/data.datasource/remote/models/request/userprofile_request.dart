// To parse this JSON data, do
//
//     final profileRequest = profileRequestFromJson(jsonString);

import 'dart:convert';


String profileRequestToJson(ProfileRequest data) => json.encode(data.toJson());

class ProfileRequest {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? bio;
  DateTime? createdAt;
  dynamic designation;
  bool? emailConfirmed;
  dynamic emailConfirmedAt;
  String? facebook;
  String? gender;
  dynamic instructorDescription;
  bool? instructorRequest;
  bool? instructorRequestConfirmed;
  dynamic instructorRequestConfirmedAt;
  dynamic instructorStatus;
  dynamic instructorSubject;
  bool? isProfilePublic;
  String? linkedin;
  dynamic location;
  dynamic muid;
  String? password;
  dynamic phone;
  dynamic profilePhoto;
  dynamic resetPasswordAt;
  DateTime? resetPasswordSendAt;
  int? resetPasswordToken;
  String? role;
  bool? status;
  String? twitter;
  DateTime? updatedAt;
  String? website;
  String? youtube;

  ProfileRequest({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.bio,
    this.createdAt,
    this.designation,
    this.emailConfirmed,
    this.emailConfirmedAt,
    this.facebook,
    this.gender,
    this.instructorDescription,
    this.instructorRequest,
    this.instructorRequestConfirmed,
    this.instructorRequestConfirmedAt,
    this.instructorStatus,
    this.instructorSubject,
    this.isProfilePublic,
    this.linkedin,
    this.location,
    this.muid,
    this.password,
    this.phone,
    this.profilePhoto,
    this.resetPasswordAt,
    this.resetPasswordSendAt,
    this.resetPasswordToken,
    this.role,
    this.status,
    this.twitter,
    this.updatedAt,
    this.website,
    this.youtube,
  });


  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "bio": bio,
    "created_at": createdAt?.toIso8601String(),
    "designation": designation,
    "email_confirmed": emailConfirmed,
    "email_confirmed_at": emailConfirmedAt,
    "facebook": facebook,
    "gender": gender,
    "instructor_description": instructorDescription,
    "instructor_request": instructorRequest,
    "instructor_request_confirmed": instructorRequestConfirmed,
    "instructor_request_confirmed_at": instructorRequestConfirmedAt,
    "instructor_status": instructorStatus,
    "instructor_subject": instructorSubject,
    "is_profile_public": isProfilePublic,
    "linkedin": linkedin,
    "location": location,
    "muid": muid,
    "password": password,
    "phone": phone,
    "profile_photo": profilePhoto,
    "reset_password_at": resetPasswordAt,
    "reset_password_send_at": resetPasswordSendAt?.toIso8601String(),
    "reset_password_token": resetPasswordToken,
    "role": role,
    "status": status,
    "twitter": twitter,
    "updated_at": updatedAt?.toIso8601String(),
    "website": website,
    "youtube": youtube,
  };
}
