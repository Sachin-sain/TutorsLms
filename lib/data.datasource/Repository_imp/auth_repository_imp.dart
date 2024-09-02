import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/change_password_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/forgot_password_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/google_login_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/register_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/UserUpdate.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/change_password_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/forgot_password_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/google_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/notofication_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/register_response.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../remote/models/request/login_request.dart';
import '../remote/models/request/userprofile_request.dart';
import '../remote/models/response/login_response.dart';
import '../remote/models/response/popular_course_response.dart';
import '../remote/models/response/userprofile_response.dart';
import '../remote/services/apis.dart';
import '../remote/services/dio/rest_client.dart';

class AuthRepositoryImpl {
  final _restClient = Get.put(RestClient());


  Future<Either<Failure, LoginResponse>> login(LoginRequest loginParams) async {
    try {
      final response = await _restClient.post(
          url: Apis.login, request: loginParams.toJson());
      return Right(loginResponseFromJson(response));
    }  on ApiException catch(e) {
      return Left(ServerFailure(e.toString(),e.type));
    }
  }


  Future<Either<Failure, RegisterResponse>> registerEmail(RegisterRequest emailParams) async {
    try {
      final response = await _restClient.post(
          url: Apis.registerByEmail, request: emailParams.toJson());
      return Right(registerResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, ForgotPasswordResponse>> forgotByEmail(ForgotPasswordRequest mobileParams) async {
    try {
      final response = await _restClient.post(url: Apis.forgotPassword, request: mobileParams.toJson());
      return Right(forgotPasswordResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }
  Future<Either<Failure, ChangePasswordResponse>> changePassword(ChangePasswordReq mobileParams) async {
    try {
      final response = await _restClient.put(url: Apis.resetPassword, request: mobileParams.toJson());
      return Right(changePasswordResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  ///user profile
  Future<Either<Failure, ProfileResponse>> userProfile(ProfileRequest mobileParams) async {
    try {
      final response = await _restClient.put(url: Apis.userProfile, request: mobileParams.toJson());
      return Right(profileResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure,PopularCourseResponse >> homePage() async {
    try {
      final response = await _restClient.get(url: Apis.banner);
      return Right(popularCourseResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure,UserUpdate >> user() async {
    try {
      final response = await _restClient.get(url: Apis.userdetail);
      return Right(userUpdateFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure,NotificationResponse >> notification() async {
    try {
      final response = await _restClient.get(url: Apis.notification);
      return Right(notificationResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure,GoogleResponse >> googleLogin(GoogleLoginRequest request) async {
    try {
      final response = await _restClient.post(url: Apis.googleLogin,request: request.toJson());
      return Right(googleResponseFromJson(response));
    }on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }
}





