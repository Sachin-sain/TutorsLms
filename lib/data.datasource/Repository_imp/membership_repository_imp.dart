import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/core/error/exceptions.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/create_payment.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/enroll_course_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/promo_code_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/stripe_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/check_order_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/check_payment_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/common_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/create_payment_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/membershipPlans_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/promo_code_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/stripe_response.dart';
import 'package:tutor_lms/data.datasource/remote/services/apis.dart';
import 'package:tutor_lms/data.datasource/remote/services/dio/rest_client.dart';

class MemberRepositoryImpl {

  final restClient = Get.find<RestClient>();

  Future<Either<Failure, MembershipPlanResponse>> memberShip() async {
    try {
      final response = await restClient.get(url: Apis.memberShipPlan,);
      return Right(membershipPlanFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, StripeResponse>> create(StripeRequest request) async {
    try {
      final response = await restClient.post(url: Apis.stripePayment, request: request.toJson());
      return Right(stripeResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, CommonResponse>> enroll(EnrollRequest request) async {
    try {
      final response = await restClient.post(url: Apis.enroll, request: request.toJson());
      return Right(commonResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, CreatePaymentResponse>> createPayment(CreatePaymentRequest request) async {
    try {
      final response = await restClient.post(url: Apis.createPayment, request: request.toJson());
      return Right(createPaymentResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, CheckOrder>> checkPayment(CheckPaymentRequest request) async {
    try {
      final response = await restClient.post(url: Apis.checkPayment, request: request.toJson());
      return Right(checkOrderFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

  Future<Either<Failure, PromoCodeResponse>> promoCode(PromoCodeRequest request) async {
    try {
      final response = await restClient.post(url: Apis.applyPromoCode, request: request.toJson());
      return Right(promoCodeResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }
}