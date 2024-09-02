import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/apptextstyle.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/presentation/Homepage/home_controller.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../constants/appcolor.dart';
import '../data.datasource/local/local_storage.dart';
import 'Course/Course.dart';

class TutorLmsSearchPage extends StatefulWidget {
  final HomepageController homepageController;
  const TutorLmsSearchPage({super.key,required this.homepageController});
  @override
  State<TutorLmsSearchPage> createState() => _TutorLmsSearchPageState();
}
class _TutorLmsSearchPageState extends State<TutorLmsSearchPage> {
  @override
  void initState() {
    widget.homepageController.onResetBanner(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      id: ControllerBuilders.homeController,
      init: widget.homepageController,
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: TutorLmsScaffold(
                body: widget.homepageController.loading ? const Center(
                  child: TutorActivityIndicator(),
                ): SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left:Dimensions.w_15 ,right: Dimensions.w_15),
                    child: Column(
                        children : [
                          VerticalSpacing(height: Dimensions.h_10),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.arrow_back_ios)),
                              HorizontalSpacing(width: Dimensions.w_10),
                              Expanded(
                                child: SizedBox(
                                  height: Dimensions.h_40,
                                  child: CupertinoTextField(
                                    cursorColor: Theme.of(context).shadowColor,
                                    style: AppTextStyle.normalTextStyle(FontSize.sp_15, Theme.of(context).highlightColor),
                                    controller: controller.searchController,
                                    onChanged: (e) {
                                      controller.filterSearch(e);
                                    },
                                    decoration:  BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    placeholder: 'Search',
                                    prefix: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,top: 3,bottom: 3),
                                      child: Icon(CupertinoIcons.search,color: Colors.grey.withOpacity(0.5),),
                                    ),
                                    suffix: Padding(
                                      padding: const EdgeInsets.only(right: 8.0,top: 3,bottom: 3),
                                      child: GestureDetector(
                                          onTap: () {
                                            controller.clearTextField();
                                          },
                                          child: Icon(Icons.clear,color: Colors.grey.withOpacity(0.5),)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          VerticalSpacing(height: Dimensions.h_10),
                          controller.filterList.isEmpty ?
                          Padding(
                            padding:  EdgeInsets.only(top: Dimensions.h_40),
                            child: Column(
                              children: [
                                VerticalSpacing(height: Dimensions.h_30),
                                TutorLmsTextWidget(title: 'No Data Found', style: AppTextStyle.themeBoldNormalTextStyle(
                                    fontSize: FontSize.sp_18,
                                    color: Theme.of(context).highlightColor
                                ))
                              ],
                            ),
                          ):ListView.builder(
                            padding: EdgeInsets.only(top: Dimensions.h_20),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount:controller.filterList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    LocalStorage.writeBool(GetXStorageConstants.searchFromHome,false);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => CourseTutor(slug: controller.filterList[index].slug ??'',
                                              id: controller.filterList[index].courseId ?? 0,)));
                                  } ,
                                  child:  TutorLmsConatiner(
                                    margin: EdgeInsets.only(
                                        right: Dimensions.w_5,
                                        bottom: Dimensions.h_20,
                                        left: Dimensions.w_5
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.h_8),
                                        color: Theme.of(context).cardColor),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Dimensions.h_50,
                                          width: Dimensions.w_80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(Dimensions.h_8),
                                              bottomLeft: Radius.circular(Dimensions.h_8)
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage( controller.search ?controller.filterList[index].image ?? ''  : controller.bannerList[index].image ?? '' )
                                            ),
                                          ),
                                        ),
                                        HorizontalSpacing(width: Dimensions.w_20),
                                        SizedBox(
                                          width: Dimensions.w_180,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              TutorLmsTextWidget(
                                                maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  title: controller.filterList[index].title ?? '',
                                                  style: AppTextStyle.normalTextStyle(FontSize.sp_12, AppColor.appColor)),
                                              VerticalSpacing(height: Dimensions.h_5),
                                              TutorLmsTextWidget(
                                                  textAlign: TextAlign.start,
                                                  title:
                                                  '${controller.filterList[index].videos?.length?? ''} lesson',
                                                  style: AppTextStyle.normalTextStyle(
                                                      FontSize.sp_10,
                                                      Theme.of(context).shadowColor)),
                                              VerticalSpacing(height: Dimensions.h_10),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              );
                            },
                          )
                        ]
                    ),
                  ),
                )
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


