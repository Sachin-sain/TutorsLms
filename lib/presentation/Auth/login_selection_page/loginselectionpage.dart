import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../../../approutes.dart';
import '../../../constants/appcolor.dart';
import '../../../constants/apptextstyle.dart';
import '../../../constants/constants.dart';
import '../../../constants/fontsize.dart';
import '../../../constants/images.dart';
import '../../../data.datasource/local/local_storage.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/tutorlms_textbutton.dart';
import '../../Homepage/homepage.dart';


class LoginSelectionPage extends StatefulWidget {
  const LoginSelectionPage({Key? key}) : super(key: key);

  @override
  State<LoginSelectionPage> createState() => _LoginSelectionPageState();
}

class _LoginSelectionPageState extends State<LoginSelectionPage> {
  late  Image image;
  @override
  void initState() {
    super.initState();
    image = Image.asset(Images.loginSelection);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }
  @override
  Widget build(BuildContext context) {
    return TutorLmsScaffold(
        backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: Dimensions.h_80,
                child: TutorLmsConatiner(
                height: Dimensions.h_418,
                width: Dimensions.defaultWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Images.loginSelection)),
                ),
            ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpacing(height: Dimensions.h_5),
                    TutorLmsTextWidget(title: 'Finding the', style: AppTextStyle.normalTextStyle(30, Theme.of(context).highlightColor)),
                    HorizontalSpacing(width: Dimensions.w_5),
                    TutorLmsTextWidget(title: 'Perfect', style: AppTextStyle.normalTextStyle(30, AppColor.appColor)),
                  ],
                ),
                VerticalSpacing(height: Dimensions.h_10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TutorLmsTextWidget(title: 'Online Course', style: AppTextStyle.normalTextStyle(30, AppColor.appColor)),
                    HorizontalSpacing(width: Dimensions.w_5),
                    TutorLmsTextWidget(title: 'for You', style: AppTextStyle.normalTextStyle(30, Theme.of(context).highlightColor)),
                  ],
                ),
                VerticalSpacing(height: Dimensions.h_20),
                TutorLmsTextWidget(
                    textAlign: TextAlign.center,
                    title: 'Click below to search and discover the most ', style: AppTextStyle.normalTextStyle(16,Theme.of(context).shadowColor)),
                VerticalSpacing(height: Dimensions.h_5),
                TutorLmsTextWidget(
                  textAlign: TextAlign.center,
                    title: 'suitable skills for you to learn. ', style: AppTextStyle.normalTextStyle(16,Theme.of(context).shadowColor)),
                VerticalSpacing(height: Dimensions.h_20),
                TutorLmsTextButton(

                  style: AppTextStyle.themeBoldNormalTextStyle(
                      fontSize: FontSize.sp_18,
                      color: AppColor.white
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.appColor,
                  labelName: 'Let Get Started',onTap: (){
                  Get.toNamed(AppRoutes.register);
                },),
                VerticalSpacing(height: Dimensions.h_10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TutorLmsTextButton(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.transparent,
                      style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_18,
                          color: AppColor.white
                      ),
                      labelName: 'Already have an account?',onTap: (){
                      Get.toNamed(AppRoutes.loginScreen);
                    },),
                    TutorLmsTextButton(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.transparent,
                      style: AppTextStyle.themeBoldNormalTextStyle(
                          fontSize: FontSize.sp_18,
                          color: AppColor.appColor
                      ),
                      labelName: ' Sign In ',onTap: (){
                      Get.toNamed(AppRoutes.loginScreen);
                    },),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    LocalStorage.writeBool(GetXStorageConstants.isLogin, false);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                  },
                    child: TutorLmsTextWidget(title: "SKip", style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor))),
                VerticalSpacing(height: Dimensions.h_30),

              ],

            ),


            ],

          ),

    );
  }
}
