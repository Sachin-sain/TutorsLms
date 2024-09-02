import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/presentation/category_api_meta_mask_connect_piccadlly_meta_boxfy_dj/boxfy_controller_chingaari.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/widgets/common_appbar.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/constants.dart';
import '../../constants/fontsize.dart';
import '../../widgets/spacing.dart';
import '../../widgets/tutor_lms_container.dart';
import '../../widgets/tutor_text.dart';
import '../Course/Course.dart';

class MetaMaskConnect extends StatefulWidget {
  final String slug;
  final String name;
  const MetaMaskConnect({super.key, required this.slug, required this.name});
  @override
  State<MetaMaskConnect> createState() => _MetaMaskConnectState();
}

class _MetaMaskConnectState extends State<MetaMaskConnect> {
  final ChikaController chikaController = Get.put(ChikaController());

  @override
  void initState() {
    chikaController.getFarziData(context, widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChikaController>(
        id: ControllerBuilders.stakingController,
        init: chikaController,
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SafeArea(
              top: true,
              child: Scaffold(
                  appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_60), child: TutorLmsAppbar(title: widget.name,onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard(index: 0)));
                  },)),
                  body: (controller.meow) ? const Center(
                    child:  CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 15,
                    ),
                  ) : (controller.categoryList.isNotEmpty) ? Padding(
                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: Dimensions.h_20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2/2.4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context) => CourseTutor(id: controller.categoryList[index].courseId ?? 0,slug: controller.categoryList[index].slug ?? ''))),
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
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                      ),
                                      image: DecorationImage(image: NetworkImage(controller
                                          .categoryList[index].image ?? ''),fit: BoxFit.cover)
                                  ),
                                ),
                                VerticalSpacing(height: Dimensions.h_13),
                                Padding(
                                  padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      TutorLmsTextWidget(
                                          textAlign: TextAlign.start,
                                          title: controller.categoryList[index]
                                              .category?.name ?? '',
                                          style: AppTextStyle.normalTextStyle(
                                              FontSize.sp_10,
                                              AppColor.appColor)),
                                    ],
                                  ),
                                ),
                                VerticalSpacing(height: Dimensions.h_5),
                                Flexible(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                                    child: TutorLmsTextWidget(
                                      softWrap: true,
                                        textOverflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                        title: controller.categoryList[index].title ?? '',
                                        style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).highlightColor)),
                                  ),
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
                                          '${controller.categoryList[index].videos?.length.toString()} lesson',
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
                    ),
                  )
                      : Center(
                    child: TutorLmsTextWidget(title: 'No data Found', style: AppTextStyle.themeBoldTextStyle(
                      fontSize: FontSize.sp_16,
                      color: Theme.of(context).shadowColor
                    ),),
                  )
              ),
            ),
          );
        }
    );
  }
}
