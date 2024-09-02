import 'dart:convert';


String forgotPasswordRequestToJson(ForgotPasswordRequest data) => json.encode(data.toJson());

class ForgotPasswordRequest {
  String email;


  ForgotPasswordRequest({
    required this.email,
  });



  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
