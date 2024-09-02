import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/approutes.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/change_password_request.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import '../../constants/constants.dart';
import '../../core/error/failures.dart';
import '../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../widgets/tutor_lms_toast.dart';

class ChangePasswordController extends GetxController {
  bool isLoading = false;
  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  final AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();

  onResetButton(BuildContext context,GlobalKey<FormState> key) async {
    if(key.currentState!.validate()) {
     if(newPasswordController.text != confirmPasswordController.text ) {
       ToastUtils.showCustomToast(context, "Confirm password doesn't match", false);
     }else{
       isLoading = true;
       update([ControllerBuilders.changePasswordController]);
       var request = ChangePasswordReq(
         oldPassword: oldPasswordController.text, password: newPasswordController.text, passwordConfirmation: confirmPasswordController.text,
       );
       var data = await repositoryImpl.changePassword(request);
       data.fold((l) {
         if (l is ServerFailure) {
           ToastUtils.showCustomToast(context, l.message ?? '', false);
           isLoading = false;
           update([ControllerBuilders.changePasswordController]);
         }
       }, (r) {
         ToastUtils.showCustomToast(context, r.message ?? '', true);
         isLoading = false;
         update([ControllerBuilders.changePasswordController]);
         oldPasswordController.clear();
         newPasswordController.clear();
         confirmPasswordController.clear();
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
       }
       );
       update([ControllerBuilders.changePasswordController]);
     }
     }
    update([ControllerBuilders.changePasswordController]);
    }

  }