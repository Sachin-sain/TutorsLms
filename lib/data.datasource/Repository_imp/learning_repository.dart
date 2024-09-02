import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/core/error/exceptions.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/learning_model.dart';
import 'package:tutor_lms/data.datasource/remote/services/apis.dart';
import 'package:tutor_lms/data.datasource/remote/services/dio/rest_client.dart';

class LearningRepository {

  final restClient = Get.find<RestClient>();

  Future<Either<Failure, LearningResponse>> learning() async {
    try {
      final response = await restClient.get(url: Apis.learning,);
      return Right(learningResponseFromJson(response));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message,e.type));
    }
  }

}