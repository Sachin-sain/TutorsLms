import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/appcolor.dart';
import 'package:tutor_lms/constants/apptextstyle.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import 'package:tutor_lms/presentation/Course/course_controller.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import 'package:tutor_lms/widgets/player/pod_player.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import 'package:flutter_html/flutter_html.dart' as flutter_html;
import '../../constants/images.dart';
import '../../widgets/tutorlms_textbutton.dart';

class CourseTutor extends StatefulWidget {
  final String slug;
  final int id;
  const CourseTutor({super.key,required this.slug, required this.id});
  @override
  State<CourseTutor> createState() => _CourseTutorState();
}

class _CourseTutorState extends State<CourseTutor> {
  final CourseController courseController = Get.put(CourseController());

  @override
  void initState() {
    courseController.get(context, widget.id, widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: courseController,
      id: ControllerBuilders.courseController,
      builder: (controller) {
      return  WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard(index: 0)));
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            bottomNavigationBar: controller.loading ? const SizedBox.shrink(): controller.hideEnroll ? const SizedBox.shrink(): Padding(
              padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_15,bottom: Dimensions.h_10),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.only(top: Dimensions.h_10),
                child: TutorLmsTextButton(
                  loading: controller.buttonLoading,
                  labelName: (LocalStorage.getBool( GetXStorageConstants.userLogin) == true || LocalStorage.getBool( GetXStorageConstants.jwtExpired) == true) ? " Login" : "Enrol now",
                  style: AppTextStyle.buttonTextStyle(
                      color: AppColor.white),
                  onTap: () {
                    (LocalStorage.getBool( GetXStorageConstants.userLogin) == true || LocalStorage.getBool( GetXStorageConstants.jwtExpired) == true) ?
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login())): controller.onEnroll(context, controller.course?.id ?? 0);
                  },
                  margin: EdgeInsets.only(top: Dimensions.h_8,bottom: Dimensions.h_20,left: Dimensions.w_20,right: Dimensions.w_20),
                  color: AppColor.appColor,
                ),
              ),
            ),
            body: controller.loading ? const Center(child: TutorActivityIndicator()) : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      PodVideoPlayer(
                        controller : controller.videoController != null
                          ? controller.videoController!
                          : PodPlayerController(playVideoFrom: PlayVideoFrom.network('')),),
                      Positioned(
                        child: Padding(
                          padding:  EdgeInsets.only(left: Dimensions.w_10,top: Dimensions.h_10),
                          child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard(index: 0)));
                          },
                          child: Icon(Icons.arrow_back,color: Theme.of(context).highlightColor),
                      ),
                        ),),
                    ],
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child: TutorLmsTextWidget(
                      softWrap: true,
                      textOverflow: TextOverflow.visible,
                        title: controller.course?.title ?? '- - -', style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_18, color: Theme.of(context).highlightColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child: TutorLmsTextWidget(
                      softWrap: true,
                        textOverflow: TextOverflow.visible,
                        title: controller.course?.shortDesc ?? '---', style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TutorLmsTextWidget(title: 'Category', style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_13, color: AppColor.appColor)),
                            TutorLmsTextWidget(title: controller.course?.category?.name ?? '---', style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_13,color: Theme.of(context).shadowColor))
                          ],
                        ),
                        HorizontalSpacing(width: Dimensions.w_50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TutorLmsTextWidget(title: 'Last Updated', style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_13, color: AppColor.appColor)),
                            TutorLmsTextWidget(title: controller.formatDate.toString() ?? '', style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_13, color: Theme.of(context).shadowColor))
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.onShareButton(controller.course?.title ?? 'meow');
                          },
                          child: TutorLmsConatiner(
                            height: Dimensions.h_35,
                            width: Dimensions.w_35,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.share,size: 15,color: Theme.of(context).shadowColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Divider(
                    color: Theme.of(context).shadowColor,
                    height: 20,
                    endIndent: 20,
                    indent: 20,
                    // indent: 3,
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding:  EdgeInsets.only(left:Dimensions.w_10),
                    child: TutorLmsTextWidget(title: 'OverView', style: AppTextStyle.normalTextStyle(FontSize.sp_20, Theme.of(context).highlightColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child:  flutter_html.Html(
                      data: controller.course?.overview ?? '',
                      style: {
                        'ul': flutter_html.Style(
                          margin: flutter_html.Margins.only(left: 0),
                          padding: flutter_html.HtmlPaddings.only(left: Dimensions.w_6),
                        ),
                        'ol': flutter_html.Style(
                          margin: flutter_html.Margins.only(left: 0),
                          padding: flutter_html.HtmlPaddings.only(left: Dimensions.w_6),
                        ),
                        '#': flutter_html.Style(
                          color:
                         Theme.of(context).shadowColor,
                        ),
                      },
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_15),
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.w_2,right: Dimensions.w_2),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child:  ExpansionTile(
                        initiallyExpanded: true,
                        tilePadding: EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        collapsedBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        iconColor:Theme.of(context).shadowColor,
                        collapsedIconColor: Theme.of(context).shadowColor,
                        textColor:Theme.of(context).shadowColor,
                        title: TutorLmsTextWidget(title: 'Course Video', style: AppTextStyle.normalTextStyle(FontSize.sp_20, Theme.of(context).highlightColor)),
                        children:  [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.course?.videos?.length ?? 0,
                              itemBuilder: (c,i) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.video(context, widget.id, controller.course?.videos?[i].id ?? 0);
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10,top: Dimensions.h_15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TutorLmsTextWidget(title: "${i+1}", style: AppTextStyle.themeBoldTextStyle(fontSize: FontSize.sp_20, color:Theme.of(context).shadowColor)),
                                        HorizontalSpacing(width: Dimensions.w_20),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: Dimensions.w_230,
                                                child: TutorLmsTextWidget(softWrap: true,maxLines: 3,textOverflow: TextOverflow.visible,title: controller.course?.videos?[i].title ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor))),
                                          ],
                                        ),
                                        const Spacer(),
                                        TutorLmsConatiner(
                                          height: Dimensions.h_25,
                                          width: Dimensions.h_25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: controller.hideEnroll == true ? DecorationImage(image: AssetImage(Images.play)): DecorationImage(image: AssetImage(controller.course?.videos?[i].isPreview == true ? Images.play : Images.locked))
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_5),
                  VerticalSpacing(height: Dimensions.h_30),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_10),
                    child: TutorLmsTextWidget(title: 'What You will learn', style: AppTextStyle.normalTextStyle(FontSize.sp_20, Theme.of(context).highlightColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child: flutter_html.Html(
                      data: controller.course?.whatYouWillLearn ?? '',
                      style: {
                        '#': flutter_html.Style(
                          color: Theme.of(context).shadowColor,
                        ),
                      },
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                (controller.course?.requirements?.isEmpty ?? false) ? SizedBox.shrink():  Column(
                  children: [
                    Padding(
                        padding:  EdgeInsets.only(left: Dimensions.w_10),
                        child: TutorLmsTextWidget(title: 'Requirements', style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor)),
                      ),
                    VerticalSpacing(height: Dimensions.h_3),
                    Padding(
                      padding:  EdgeInsets.only(left: Dimensions.w_10),
                      child: TutorLmsTextWidget(title: controller.course?.requirements ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).shadowColor)),
                    ),
                  ],
                ),
                  VerticalSpacing(height: Dimensions.h_20),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_20),
                    child: TutorLmsTextWidget(title: 'Meet Your Instructors', style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: Dimensions.h_35,
                            width: Dimensions.h_35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.h_30),
                                child: Image.network('https://tutorslms.com/images/avatar.jpg'))),
                        HorizontalSpacing(width: Dimensions.w_20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TutorLmsTextWidget(title: "TutorsLms",style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),),
                            TutorLmsTextWidget(title: "Teacher",style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                  Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_10),
                    child: TutorLmsTextWidget(softWrap: true,textOverflow: TextOverflow.visible,title: controller.course?.user?.bio ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                  ),
                  VerticalSpacing(height: Dimensions.h_20),
                ],
              ),
            ),
          ),
        ),
      );
      },
    );
  }



  @override
  void dispose() {
    courseController.videoController?.dispose();
    Get.delete<CourseController>();
    super.dispose();
  }
  }

