
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/register_request.dart';
import '../../../approutes.dart';
import '../../../constants/constants.dart';
import '../../../core/error/failures.dart';
import '../../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../../data.datasource/local/local_storage.dart';
import '../../../widgets/tutor_lms_toast.dart';


class RegisterController extends GetxController {
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController otpController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController lastnameController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  bool agreeButtonTapped = false;
  bool closeEye = true;
  bool invitedClicked = false;
  bool isPhone = false;
  bool isEmail = true;
  bool isLoading = false;
  int? data;
   AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();
  agreeButton() {
    agreeButtonTapped = !agreeButtonTapped;
    update([ControllerBuilders.registerController]);
  }

  invitedButtonClicked() {
    invitedClicked = !invitedClicked;
    update([ControllerBuilders.registerController]);
  }

  changeEye() {
    closeEye = !closeEye;
    update([ControllerBuilders.registerController]);
  }

  emailButton (BuildContext context) {
    isEmail = true;
    isPhone = false;
    passwordController.clear();
    passwordController.clear();
    update([ControllerBuilders.registerController]);
  }
  phoneButton() {
    isEmail = false;
    isPhone = true;
    emailController.clear();
    passwordController.clear();
    update([ControllerBuilders.registerController]);
  }

  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();



  registerByEmail(BuildContext context,String token) async {
    isLoading = true;
    update([ControllerBuilders.registerController]);
    var request = RegisterRequest(
      email: emailController.text,
      password: passwordController.text,
      firstName: nameController.text,
      lastName:lastnameController.text ,
      terms: true,
      token: token
    );
    var data = await repositoryImpl.registerEmail(request);
    data.fold((l) {
      if (l is ServerFailure) {
        ToastUtils.showCustomToast(context, l.message ?? '', false);
        isLoading = false;
        update([ControllerBuilders.registerController]);
      }
    }, (r) {
      isLoading=false;
      ToastUtils.showCustomToast(context, r.message ?? '', true);
      LocalStorage.writeBool(GetXStorageConstants.userLogin, false);
      LocalStorage.setAuthToken(r.elarnivUsersToken);
      update([ControllerBuilders.registerController]);
      Get.toNamed(AppRoutes.dashBoard);
    }
    );
    update([ControllerBuilders.registerController]);
  }
}
