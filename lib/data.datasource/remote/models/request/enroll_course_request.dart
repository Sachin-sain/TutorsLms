import 'dart:convert';

String forgotPasswordRequestToJson(EnrollRequest data) => json.encode(data.toJson());

class EnrollRequest {
  int courseId;

  EnrollRequest({
    required this.courseId,
  });


  Map<String, dynamic> toJson() => {
    "courseId": courseId,
  };
}
