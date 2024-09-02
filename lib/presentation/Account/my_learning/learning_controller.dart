import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/learning_repository.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/learning_model.dart';
import 'package:tutor_lms/widgets/tutor_lms_toast.dart';

class LearningController extends GetxController {
  bool loading = false;
  final LearningRepository repository = LearningRepository();
  List<Enrolment>? list;

  onLearning(BuildContext context) async {
    loading = true;
    var data = await repository.learning();
    data.fold((l) {
      if (l is ServerFailure) {
        loading = false;
        ToastUtils.showCustomToast(context, l.message ?? '', false);
        update([ControllerBuilders.learningController]);
      }
    }, (r) {
      list?.clear();
      list = r.enrolments ?? [];
      loading = false;
      update([ControllerBuilders.learningController]);
    });
    update([ControllerBuilders.learningController]);
  }
}