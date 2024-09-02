

import 'dart:convert';


String changePasswordReqToJson(ChangePasswordReq data) => json.encode(data.toJson());

class ChangePasswordReq {
  String oldPassword;
  String password;
  String passwordConfirmation;

  ChangePasswordReq({
    required this.oldPassword,
    required this.password,
    required this.passwordConfirmation,
  });



  Map<String, dynamic> toJson() => {
    "old_password": oldPassword,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
