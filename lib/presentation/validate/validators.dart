import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static var usernameValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter username."),
  ]);

  static var emailValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter email."),
    EmailValidator(errorText: "Please enter valid email."),
    PatternValidator(r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$', errorText: "Please enter valid email."),
    MaxLengthValidator(50, errorText: "Email should not be greater than 50 characters.")
  ]);
  static var nameValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter name."),
  ]);
  static var passwordValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 6-20 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var passwordOldValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter old password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 6-20 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var passwordNewValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter New password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 6-20 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var passwordConfirmValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter confirm password."),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])', errorText: "Password must be 6-20 characters long, and contain at least 1 uppercase, 1 lowercase, 1 number and 1 special character."),
  ]);

  static var loginPasswordValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter password."),
  ]);

  static var forgotPasswordEmailValidate = MultiValidator([
    RequiredValidator(errorText: "Please enter email."),
    EmailValidator(errorText: "Please enter valid email."),
  ]);

  static var phoneNumberValidate = MultiValidator([
    RequiredValidator(errorText: 'Please enter phone number'),
    PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',errorText: "Phone number must be 10 or 12 digits")
  ]);

  static var uid = MultiValidator([
    RequiredValidator(errorText: 'Please enter uid number'),
  ]);

  static var otpValidate = MultiValidator([
    RequiredValidator(errorText: 'Please enter OTP'),
    PatternValidator(r'^\d{6}$', errorText: "Phone number must be 6 digits")
  ]);

  static var amount = MultiValidator([
    RequiredValidator(errorText: 'Please enter amount'),
  ]);

  static var subject = MultiValidator([
    RequiredValidator(errorText: 'Please enter subject'),
  ]);
  static var des = MultiValidator([
    RequiredValidator(errorText: 'Please enter description'),
  ]);
}