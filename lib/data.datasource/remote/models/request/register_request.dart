
import 'dart:convert';
String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;
  String token;
  bool terms;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.terms,
    required this.token
  });



  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "terms": terms,
    "token" : token
  };
}
