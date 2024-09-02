import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutor_lms/presentation/User_profile/userprofilleController.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import 'package:tutor_lms/widgets/tutor_textfield.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constants.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/spacing.dart';
import '../../widgets/tutorlms_textbutton.dart';
import '../validate/validators.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final  _picker = ImagePicker();
  File? frontImage;

  Future<void> openFrontImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      frontImage = File(pickedImage.path);
    }
  }
  final UserprofileController userprofileController = Get.put(UserprofileController());

  @override
  void initState() {
  getDetails();
    super.initState();
  }

  getDetails() async {
    await userprofileController.onProfile(context);
    userprofileController.firstNameController.text = userprofileController.user?.firstName ?? '';
    userprofileController.lastNameController.text = userprofileController.user?.lastName ?? '';
    userprofileController.genderMeow = userprofileController.user?.gender ?? '';
    userprofileController.websiteUrlController.text = userprofileController.user?.website ?? '';
    userprofileController.twitterController.text = userprofileController.user?.twitter ?? '';
    userprofileController.facebookController.text = userprofileController.user?.facebook ?? '';
    userprofileController.linkedinController.text = userprofileController.user?.linkedin ?? '';
    userprofileController.youtubeController.text = userprofileController.user?.youtube ?? '';
    userprofileController.bioController.text = userprofileController.user?.bio ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: TutorLmsConatiner(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor
        ),
        child: GetBuilder(
          init: userprofileController,
          id: ControllerBuilders.userProfileController,
          builder: (controller) {
            return SafeArea(
              child: TutorLmsScaffold(
                  body: controller.isLoading ? const Center(child: TutorActivityIndicator(),): Form(
                    key: controller.firstNameKey,
                    child: Padding(
                      padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerticalSpacing(height: Dimensions.h_10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard(index: 3)));
                                    },
                                    child: Icon(Icons.arrow_back,color: Theme.of(context).shadowColor,)),
                                HorizontalSpacing(width: Dimensions.w_10),
                                TutorLmsTextWidget(title: 'User Profile', style: AppTextStyle.normalTextStyle(FontSize.sp_22, Theme.of(context).highlightColor))
                              ],
                            ),
                            VerticalSpacing(height: Dimensions.h_20),
                            Center(
                              child: Stack(
                                children: [
                                  frontImage !=null ?
                                  CircleAvatar(
                                    radius: Dimensions.h_50,
                                    foregroundImage:  FileImage(frontImage ?? File('')),
                                  )
                                  :  CircleAvatar(
                                    radius: Dimensions.h_50,
                                   foregroundImage: const AssetImage(Images.avatar),
                                  ),
                                  Positioned(
                                    right: Dimensions.w_8,
                                      top: Dimensions.h_100,
                                      child: GestureDetector(
                                        onTap: (){
                                          openFrontImagePicker();
                                        },
                                          child: Image.asset(Images.camera))),
                                ],
                              )
                            ),
                            VerticalSpacing(height: Dimensions.h_10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TutorLmsTextWidget(title: ' First name', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                                HorizontalSpacing(width: Dimensions.w_100),
                                TutorLmsTextWidget(title: 'Last name', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),

                              ],
                            ),
                            VerticalSpacing(height: Dimensions.h_5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TutorLmsTextField(
                                    title: 'First Name',
                                    hintText: 'First Name',
                                    validator: Validator.nameValidate,
                                    controller: controller.firstNameController,
                                  ),
                                ),
                                HorizontalSpacing(width: Dimensions.w_20),
                                Expanded(
                                  child: TutorLmsTextField(
                                    title: 'Last Name',
                                    hintText: 'Last Name',
                                    validator: Validator.nameValidate,
                                    controller: controller.lastNameController,
                                  ),
                                ),
                              ],
                            ),
                            TutorLmsTextWidget(title: 'Gender', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            GestureDetector(
                              onTap: () {
                                controller.showSheet(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: Dimensions.h_10),
                                padding: EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_15),
                                height: Dimensions.h_40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).shadowColor.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TutorLmsTextWidget(title: controller.genderMeow ?? 'Select Gender', style: AppTextStyle.themeBoldNormalTextStyle(
                                      fontSize: FontSize.sp_12,
                                      color: Theme.of(context).shadowColor,
                                    )),
                                    RotatedBox(quarterTurns: 1,
                                        child: Icon(Icons.arrow_forward_ios,size: 12,color: Theme.of(context).shadowColor,)),
                                  ],
                                ),
                              ),
                            ),
                            TutorLmsTextWidget(title: 'Website Url', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: 'Website Url',
                              hintText: 'Website Url',
                              controller: controller.websiteUrlController,
                            ),
                            TutorLmsTextWidget(title: 'Twitter', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: 'Twitter Url',
                              hintText: 'Twitter Url',
                              controller: controller.twitterController,
                            ),
                            TutorLmsTextWidget(title: 'Facebook', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: 'Facebook Url',
                              hintText: 'Facebook Url',
                              controller: controller.facebookController,
                            ),
                            TutorLmsTextWidget(title: 'Linkedin', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: 'Linkedin Url',
                              hintText: 'Linkedin Url',
                              controller: controller.linkedinController,
                            ),
                            TutorLmsTextWidget(title: 'Youtube', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: 'Youtube Url',
                              hintText: 'Youtube Url',
                              controller: controller.youtubeController,
                            ),
                            TutorLmsTextWidget(title: 'Biography', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                            VerticalSpacing(height: Dimensions.h_5),
                            TutorLmsTextField(
                              title: ' Bio',
                              hintText: 'Bio',
                              controller: controller.bioController,
                            ),
                            VerticalSpacing(height: Dimensions.h_10),
                            TutorLmsTextButton(
                              loading: controller.buttonLoading,
                                labelName: 'Submit',
                                margin: EdgeInsets.only(top: Dimensions.h_12),
                                onTap: (){
                                  controller.onProfileButton(context);
                                } ),
                            VerticalSpacing(height: Dimensions.h_10),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}



