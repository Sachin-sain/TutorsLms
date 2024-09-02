import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/apptextstyle.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/UserUpdate.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../../constants/constants.dart';
import '../../core/error/failures.dart';
import '../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../data.datasource/remote/models/request/userprofile_request.dart';
import '../../widgets/tutor_lms_toast.dart';

class UserprofileController extends GetxController {
  bool isLoading = false;
  bool buttonLoading = false;
  TextEditingController  gender =TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController websiteUrlController=TextEditingController();
  TextEditingController facebookController=TextEditingController();
  TextEditingController youtubeController=TextEditingController();
  TextEditingController linkedinController=TextEditingController();
  TextEditingController twitterController=TextEditingController();
  TextEditingController bioController=TextEditingController();
  UserDetails? user;
  String? genderMeow;
  final AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();
  GlobalKey<FormState> firstNameKey = GlobalKey<FormState>();



  onProfile(BuildContext context) async {
    isLoading = true;
    var data = await repositoryImpl.user();
    data.fold((l) {
      if (l is ServerFailure) {
        isLoading = false;
        ToastUtils.showCustomToast(context, l.message ?? '', false);
      }
    }, (r) {
      user = r.user;
      isLoading = false;
      update([ControllerBuilders.userProfileController]);
    });
    update([ControllerBuilders.userProfileController]);
  }

  showSheet (BuildContext context) {
    return showModalBottomSheet
      (backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.25,
              maxChildSize: 0.25,
              minChildSize: 0.25,
              expand: true,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
                  decoration:  BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacing(height: Dimensions.h_10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TutorLmsTextWidget(title: 'Select Gender', style: AppTextStyle.themeBoldNormalTextStyle(
                              fontSize: FontSize.sp_20,
                              color: Theme.of(context).shadowColor
                          )),
                          GestureDetector(
                              onTap: ()=> Navigator.pop(context),
                              child: Icon(Icons.clear,color: Theme.of(context).shadowColor,size: 17,)),
                        ],
                      ),
                      VerticalSpacing(height: Dimensions.h_20),
                      GestureDetector(
                        onTap: () {
                          genderMeow = 'Male';
                          Navigator.pop(context);
                          update([ControllerBuilders.userProfileController]);
                        },
                        child: TutorLmsTextWidget(title: 'Male', style: AppTextStyle.themeBoldNormalTextStyle(
                            fontSize: FontSize.sp_18,
                            color: Theme.of(context).highlightColor
                        )),
                      ),
                      VerticalSpacing(height: Dimensions.h_3),
                      Divider(color: Theme.of(context).shadowColor.withOpacity(0.2),),
                      VerticalSpacing(height: Dimensions.h_3),
                      GestureDetector(
                        onTap: () {
                          genderMeow = 'Female';
                          Navigator.pop(context);
                          update([ControllerBuilders.userProfileController]);
                        },
                        child: TutorLmsTextWidget(title: 'Female', style: AppTextStyle.themeBoldNormalTextStyle(
                            fontSize: FontSize.sp_18,
                            color: Theme.of(context).highlightColor
                        )),
                      ),
                      VerticalSpacing(height: Dimensions.h_3),
                      Divider(color: Theme.of(context).shadowColor.withOpacity(0.2),),
                      VerticalSpacing(height: Dimensions.h_3),
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  onProfileButton(BuildContext context) async {
    buttonLoading = true;
        update([ControllerBuilders.userProfileController]);
        var request = ProfileRequest(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          website: websiteUrlController.text,
          facebook: facebookController.text,
          youtube: youtubeController.text,
          linkedin: linkedinController.text,
          bio: bioController.text,
          twitter: twitterController.text,
          gender: genderMeow ?? 'Male',
        );
        var data = await repositoryImpl.userProfile(request);
        data.fold((l) {
          if (l is ServerFailure) {
            ToastUtils.showCustomToast(context, l.message ?? '', false);
            buttonLoading = false;
            update([ControllerBuilders.userProfileController]);
          }
        }, (r) {
          buttonLoading = false;
              ToastUtils.showCustomToast(context, r.message ?? '', true);
              update([ControllerBuilders.userProfileController]);
        }
        );
        update([ControllerBuilders.changePasswordController]);
      }

    }

