import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/presentation/Notification/notification_controller.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/widgets/common_appbar.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/spacing.dart';
import '../../widgets/tutor_text.dart';

class TutorNotification extends StatefulWidget {
  const TutorNotification({super.key});
  @override
  State<TutorNotification> createState() => _TutorNotificationState();
}
class _TutorNotificationState extends State<TutorNotification> {
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  void initState() {
    notificationController.notification(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: ControllerBuilders.notificationController,
      init: notificationController,
      builder: (controller) {
        return  WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_55), child:  TutorLmsAppbar(
                title: 'Notification',
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));
                },
              ),),
              body: Column(
                children: [
                  VerticalSpacing(height: Dimensions.h_40),
                  controller.loading  ?  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: Dimensions.h_250),
                      child: const TutorActivityIndicator(),
                    ),
                  ): (controller.notificationList?.isNotEmpty ?? false ) ? ListView.builder(
                    itemCount: controller.notificationList?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DateTime enrollmentDate1 = controller.notificationList?[index].createdAt ?? DateTime(00, 00, 00);
                      String formattedDate = DateFormat.yMd().format(enrollmentDate1);
                      return SizedBox(
                        child: Padding(
                          padding:  EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Dimensions.h_30,
                                width: Dimensions.h_30,
                                child: Image.asset(Images.message,),
                              ),
                              HorizontalSpacing(width: Dimensions.w_30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TutorLmsTextWidget(title: controller.notificationList?[index].title ?? "", style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                                  SizedBox(
                                    width: Dimensions.w_185,
                                      child: TutorLmsTextWidget(softWrap: true,textOverflow: TextOverflow.fade,title: controller.notificationList?[index].description ?? "", style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor))),
                                ],
                              ),
                              TutorLmsTextWidget(title:  formattedDate ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor)),
                            ],
                          ),
                        ),
                      );
                    },
                  ) : Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_150),
                      child: Image.asset(Images.NotificationImage),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }

}
