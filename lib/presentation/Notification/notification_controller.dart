import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/auth_repository_imp.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/notofication_response.dart';
import 'package:tutor_lms/widgets/tutor_lms_toast.dart';

class NotificationController extends GetxController {
  bool loading = false;
  List<ListElement>? notificationList;
  final AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();

  notification(BuildContext context) async {
    try {
      loading = true;
      var data = await repositoryImpl.notification();

      data.fold(
            (l) {
          if (l is ServerFailure) {
            loading = false;
            ToastUtils.showCustomToast(context, l.message ?? '', false);
          }
        },
            (r) {
          loading = false;
          notificationList ??= [];
          if (r.list != null) {
            log(r.list![0].title.toString() ?? 'empty');
            notificationList?.clear();
            notificationList!.addAll(r.list!);
          }
        },
      );
    } catch (e) {
      loading = false;
      print("Error: $e");
    }

    update([ControllerBuilders.notificationController]);
  }
}
