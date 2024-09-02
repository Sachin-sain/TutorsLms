// // To parse this JSON data, do
// //
// //     final notificationResponse = notificationResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// NotificationResponse notificationResponseFromJson(String str) => NotificationResponse.fromJson(json.decode(str));
//
// String notificationResponseToJson(NotificationResponse data) => json.encode(data.toJson());
//
// class NotificationResponse {
//   PageProps pageProps;
//   bool nSsp;
//
//   NotificationResponse({
//     required this.pageProps,
//     required this.nSsp,
//   });
//
//   factory NotificationResponse.fromJson(Map<String, dynamic> json) => NotificationResponse(
//     pageProps: PageProps.fromJson(json["pageProps"]),
//     nSsp: json["__N_SSP"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pageProps": pageProps.toJson(),
//     "__N_SSP": nSsp,
//   };
// }
//
// class PageProps {
//   User user;
//   int students;
//   int instructors;
//   int courses;
//   int enrolments;
//   String earningsTotal;
//   int videos;
//   int assets;
//
//   PageProps({
//     required this.user,
//     required this.students,
//     required this.instructors,
//     required this.courses,
//     required this.enrolments,
//     required this.earningsTotal,
//     required this.videos,
//     required this.assets,
//   });
//
//   factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
//     user: User.fromJson(json["user"]),
//     students: json["students"],
//     instructors: json["instructors"],
//     courses: json["courses"],
//     enrolments: json["enrolments"],
//     earningsTotal: json["earningsTotal"],
//     videos: json["videos"],
//     assets: json["assets"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user.toJson(),
//     "students": students,students
//     "instructors": instructors,
//     "courses": courses,
//     "enrolments": enrolments,
//     "earningsTotal": earningsTotal,
//     "videos": videos,
//     "assets": assets,
//   };
// }
//
// class User {
//   int id;
//   String firstName;
//   String lastName;
//   String email;
//   String password;
//   dynamic muid;
//   dynamic gender;
//   dynamic designation;
//   dynamic bio;
//   dynamic profilePhoto;
//   dynamic location;
//   dynamic phone;
//   int resetPasswordToken;
//   DateTime resetPasswordSendAt;
//   dynamic resetPasswordAt;
//   dynamic website;
//   dynamic twitter;
//   dynamic facebook;
//   dynamic linkedin;
//   dynamic youtube;
//   String role;
//   bool emailConfirmed;
//   dynamic emailConfirmedAt;
//   bool instructorRequest;
//   bool instructorRequestConfirmed;
//   dynamic instructorRequestConfirmedAt;
//   dynamic instructorStatus;
//   dynamic instructorSubject;
//   dynamic instructorDescription;
//   bool status;
//   bool isProfilePublic;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.password,
//     required this.muid,
//     required this.gender,
//     required this.designation,
//     required this.bio,
//     required this.profilePhoto,
//     required this.location,
//     required this.phone,
//     required this.resetPasswordToken,
//     required this.resetPasswordSendAt,
//     required this.resetPasswordAt,
//     required this.website,
//     required this.twitter,
//     required this.facebook,
//     required this.linkedin,
//     required this.youtube,
//     required this.role,
//     required this.emailConfirmed,
//     required this.emailConfirmedAt,
//     required this.instructorRequest,
//     required this.instructorRequestConfirmed,
//     required this.instructorRequestConfirmedAt,
//     required this.instructorStatus,
//     required this.instructorSubject,
//     required this.instructorDescription,
//     required this.status,
//     required this.isProfilePublic,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     email: json["email"],
//     password: json["password"],
//     muid: json["muid"],
//     gender: json["gender"],
//     designation: json["designation"],
//     bio: json["bio"],
//     profilePhoto: json["profile_photo"],
//     location: json["location"],
//     phone: json["phone"],
//     resetPasswordToken: json["reset_password_token"],
//     resetPasswordSendAt: DateTime.parse(json["reset_password_send_at"]),
//     resetPasswordAt: json["reset_password_at"],
//     website: json["website"],
//     twitter: json["twitter"],
//     facebook: json["facebook"],
//     linkedin: json["linkedin"],
//     youtube: json["youtube"],
//     role: json["role"],
//     emailConfirmed: json["email_confirmed"],
//     emailConfirmedAt: json["email_confirmed_at"],
//     instructorRequest: json["instructor_request"],
//     instructorRequestConfirmed: json["instructor_request_confirmed"],
//     instructorRequestConfirmedAt: json["instructor_request_confirmed_at"],
//     instructorStatus: json["instructor_status"],
//     instructorSubject: json["instructor_subject"],
//     instructorDescription: json["instructor_description"],
//     status: json["status"],
//     isProfilePublic: json["is_profile_public"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "first_name": firstName,
//     "last_name": lastName,
//     "email": email,
//     "password": password,
//     "muid": muid,
//     "gender": gender,
//     "designation": designation,
//     "bio": bio,
//     "profile_photo": profilePhoto,
//     "location": location,
//     "phone": phone,
//     "reset_password_token": resetPasswordToken,
//     "reset_password_send_at": resetPasswordSendAt.toIso8601String(),
//     "reset_password_at": resetPasswordAt,
//     "website": website,
//     "twitter": twitter,
//     "facebook": facebook,
//     "linkedin": linkedin,
//     "youtube": youtube,
//     "role": role,
//     "email_confirmed": emailConfirmed,
//     "email_confirmed_at": emailConfirmedAt,
//     "instructor_request": instructorRequest,
//     "instructor_request_confirmed": instructorRequestConfirmed,
//     "instructor_request_confirmed_at": instructorRequestConfirmedAt,
//     "instructor_status": instructorStatus,
//     "instructor_subject": instructorSubject,
//     "instructor_description": instructorDescription,
//     "status": status,
//     "is_profile_public": isProfilePublic,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
