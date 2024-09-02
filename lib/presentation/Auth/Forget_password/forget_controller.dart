import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/forgot_password_request.dart';
import '../../../constants/constants.dart';
import '../../../core/error/failures.dart';
import '../../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../../widgets/tutor_lms_toast.dart';
import '../login/login.dart';


class ForgotController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  bool loading = false;
  bool isEmail = true;
  AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();

  forgotByEmail(BuildContext context) async {
  loading = true;
  update([ControllerBuilders.forgotController]);

    var request = ForgotPasswordRequest(
      email: emailTextController.text,

    );
    var data = await repositoryImpl.forgotByEmail(request);
    data.fold((l) {
      if (l is ServerFailure) {
        loading = false;
        ToastUtils.showCustomToast(context, l.message ?? '', false);
        update([ControllerBuilders.forgotController]);
      }
    }, (r) {
      loading = false;
      ToastUtils.showCustomToast(context, r.message ?? '', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
      update([ControllerBuilders.forgotController]);

    });
    update([ControllerBuilders.forgotController]);

  }

}
