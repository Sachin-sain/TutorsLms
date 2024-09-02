import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutor_lms/approutes.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/google_login_request.dart';
import '../../../constants/constants.dart';
import '../../../core/error/failures.dart';
import '../../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../../data.datasource/remote/models/request/login_request.dart';
import '../../../widgets/tutor_lms_toast.dart';

class LoginController extends GetxController {
  final emailNodeFocus = FocusNode();
  final passwordNodeFocus = FocusNode();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool closeEye = true;
  bool isPhone = false;
  bool isEmail = true;
  bool isLoading = false;
  bool loading = false;
  AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();
  String? token;
  String? googleToken;
  GoogleSignIn googleSignIn = GoogleSignIn();

  changeEye() {
    closeEye = !closeEye;
    update([ControllerBuilders.loginPageController]);
  }
  emailButton (BuildContext context) {
    isEmail = true;
    isPhone = false;
    update([ControllerBuilders.loginPageController]);
  }
  phoneButton(BuildContext context) {
    isEmail = false;
    isPhone = true;
    update([ControllerBuilders.loginPageController]);
  }

  loginWithGoogle(BuildContext context) async {
    googleSignIn.signIn().then((result){
      result?.authentication.then((googleKey){
        print("=============++> ${googleKey.idToken}");
        verifyGoogle(context, googleKey.idToken ?? '');
        print(emailTextController.text);
      }).catchError((err){
        print('Error occured inside');
      });
    }).catchError((err){
      print('Error occured outside');
    });

  }

  verifyGoogle(BuildContext context,String token) async {
    loading = true;
    update([ControllerBuilders.loginPageController]);
    var request = GoogleLoginRequest(token: token, type: Platform.isAndroid ? "android" : 'ios');
    var data = await repositoryImpl.googleLogin(request);
    data.fold((l) {
      if (l is ServerFailure) {
        ToastUtils.showCustomToast(context, l.message ?? '', false);
        loading = false;
        update([ControllerBuilders.loginPageController]);
      }
    }, (r) {
      loading = false;
      LocalStorage.setAuthToken(r.token ?? '');
      ToastUtils.showCustomToast(context, r.message ?? '', true);
      LocalStorage.writeBool(GetXStorageConstants.isLogin, true);
      LocalStorage.writeBool(GetXStorageConstants.userLogin, false);
      LocalStorage.writeBool(GetXStorageConstants.jwtExpired, false);
      update([ControllerBuilders.loginPageController]);
      Get.toNamed(AppRoutes.dashBoard);
    }
    );
    update([ControllerBuilders.loginPageController]);
  }

  login(BuildContext context,String token) async {
    isLoading = true;
    update([ControllerBuilders.loginPageController]);
    var request = LoginRequest(
      email: emailTextController.text,
      password: passwordTextController.text,
      token: token

    );
    var data = await repositoryImpl.login(request);
    data.fold((l) {
      if (l is ServerFailure) {
        ToastUtils.showCustomToast(context, l.message ?? '', false);
        isLoading = false;
        update([ControllerBuilders.loginPageController]);

      }
    }, (r) {
      isLoading = false;
      ToastUtils.showCustomToast(context, r.message ?? '', true);
      LocalStorage.setAuthToken(r.elarnivUsersToken);
      LocalStorage.writeBool(GetXStorageConstants.isLogin, true);
      LocalStorage.writeBool(GetXStorageConstants.userLogin, false);
      LocalStorage.writeBool(GetXStorageConstants.jwtExpired, false);
      update([ControllerBuilders.loginPageController]);
      emailTextController.clear();
      passwordTextController.clear();
      Get.toNamed(AppRoutes.dashBoard);
    }
    );
    update([ControllerBuilders.loginPageController]);
  }

}


