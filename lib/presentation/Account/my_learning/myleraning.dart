import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/presentation/Account/my_learning/learning_controller.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/common_appbar.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import '../../../constants/appcolor.dart';
import '../../../constants/apptextstyle.dart';
import '../../../constants/fontsize.dart';
import '../../../data.datasource/remote/models/response/learning_model.dart';
import '../../../data.datasource/remote/services/apis.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/tb_cached_image.dart';
import '../../../widgets/tutor_lms_container.dart';
import '../../../widgets/tutor_text.dart';
import '../../Course/Course.dart';
import '../../dashboard/dashboard.dart';
class MyLearning extends StatefulWidget {
  const MyLearning({super.key});

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {

 final LearningController learningController = Get.put(LearningController());

  @override
  void initState() {
    learningController.onLearning(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: learningController,
      id: ControllerBuilders.learningController,
      builder: (controller) {
        return   WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: TutorLmsScaffold(
              appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_50), child:
              TutorLmsAppbar(title: 'My Learnings',onTap: ()=> Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> DashBoard(index: 3))),color: Theme.of(context).scaffoldBackgroundColor,)),
                body: controller.loading ?  const Center(
                  child: TutorActivityIndicator(),
                ) :  Padding(
                  padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                  child: Column(
                    children: [
                      VerticalSpacing(height: Dimensions.h_10),
                       (controller.list?.isNotEmpty ?? false) ?
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2/2.4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 15,
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: controller.list?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              LocalStorage.writeBool(GetXStorageConstants.searchFromHome, true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => CourseTutor(
                                        id: controller.list?[index].courseId ?? 0,
                                          slug: controller.list?[index].course?.slug ?? '')));
                            } ,
                            child: TutorLmsConatiner(
                              width: Dimensions.w_185,
                              margin: EdgeInsets.only(
                                right: Dimensions.w_10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    height: Dimensions.h_100,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)
                                        ),
                                        image: DecorationImage(image: NetworkImage(controller
                                            .list?[index].course?.image ?? ''),fit: BoxFit.cover)
                                    ),
                                  ),
                                  VerticalSpacing(height: Dimensions.h_5),
                                  Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                                    child: TutorLmsTextWidget(
                                        textOverflow: TextOverflow.clip,
                                        textAlign: TextAlign.start,
                                        title: controller.list?[index].course?.title ?? '',
                                        style: AppTextStyle.normalTextStyle(
                                            FontSize.sp_10,
                                            AppColor.appColor)),
                                  ),
                                  VerticalSpacing(height: Dimensions.h_5),
                                  Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                                    child: TutorLmsTextWidget(
                                        textOverflow: TextOverflow.fade,
                                        textAlign: TextAlign.start,
                                        title: controller.list?[index].course?.shortDesc ?? '',
                                        style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).highlightColor)),
                                  ),
                                  VerticalSpacing(height: Dimensions.h_5),
                                  Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        TutorLmsTextWidget(
                                            textAlign: TextAlign.start,
                                            title:
                                            '${controller.list?[index].course?.videos?.length} lesson',
                                            style: AppTextStyle.normalTextStyle(
                                                FontSize.sp_10,
                                                Theme.of(context).shadowColor)),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: Dimensions.w_10),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: TutorLmsConatiner(
                                              width: Dimensions.w_20,
                                              height: Dimensions.h_20,
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .shadowColor,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Theme.of(context)
                                                    .highlightColor,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                          :  Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.h_150),
                          child: Text("No items available",style: AppTextStyle.themeBoldNormalTextStyle(
                              fontSize: FontSize.sp_16,color: Theme.of(context).highlightColor
                          ),),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        );
      },

    );
  }

}
