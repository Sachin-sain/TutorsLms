import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/presentation/All_course/All_Course.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../../constants/appcolor.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../Account/Account.dart';
import '../CourseDashboard/CourseDashboard.dart';
import '../Homepage/homepage.dart';

class DashBoard extends StatefulWidget {
   final int? index;
    const DashBoard({Key? key,this.index,}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with WidgetsBindingObserver {
  int selectedIndex = 0;
  List<Widget> pages = [];

  onPage(int index) {
    setState(() {
      selectedIndex = index;
      if(selectedIndex == 1){
        LocalStorage.writeBool(GetXStorageConstants.home, false);
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    selectedIndex = widget.index ?? 0;
    pages = [
      const HomePage(),
      const AllCourse(),
      const CourseDashboard(),
      const Account(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: TutorLmsScaffold(
        body: LocalStorage.getBool(GetXStorageConstants.userLogin) == true && selectedIndex == 2 ? const Login() : pages[selectedIndex],
        bottomNavigationBar: LocalStorage.getBool(GetXStorageConstants.userLogin) == true && selectedIndex == 2 ? const SizedBox() : SalomonBottomBar(
          currentIndex: selectedIndex,
          backgroundColor: Theme.of(context).hintColor,
          onTap: (int i) {
            onPage(i);
          },
          items: [
          SalomonBottomBarItem(
            activeIcon: SizedBox(
                height: Dimensions.h_20,
                width: Dimensions.h_20,
                child: Image.asset(Images.home,color: AppColor.appColor,)),
            icon: SizedBox(
                height: Dimensions.h_23,
                width: Dimensions.h_23,
                child: Image.asset(Images.home)),
            title: TutorLmsTextWidget(title: "Home",style: AppTextStyle.themeBoldNormalTextStyle(
                fontSize: FontSize.sp_13,color: AppColor.appColor
            ),),
          ),
          SalomonBottomBarItem(
            activeIcon: SizedBox(
                height: Dimensions.h_20,
                width: Dimensions.h_20,
                child: Image.asset(Images.exchange,color: AppColor.appColor,)),
            icon: SizedBox(
                height: Dimensions.h_20,
                width: Dimensions.h_20,
                child: Image.asset(Images.exchange)),
            title: TutorLmsTextWidget(title: "Courses",style: AppTextStyle.themeBoldNormalTextStyle(
                fontSize: FontSize.sp_12,color: AppColor.appColor
            ),),
          ),
          SalomonBottomBarItem(
            activeIcon: SizedBox(
                height: Dimensions.h_20,
                width: Dimensions.h_20,
                child: Image.asset(Images.wallet,color: AppColor.appColor,)),
            icon: SizedBox(
              height: Dimensions.h_20,
                width: Dimensions.h_20,
                child: Image.asset(Images.wallet)),
            title: TutorLmsTextWidget(title: "Dashboard",style: AppTextStyle.themeBoldNormalTextStyle(
                fontSize: FontSize.sp_13,color: AppColor.appColor
            ),),
          ),
          SalomonBottomBarItem(
                activeIcon: SizedBox(
                    height: Dimensions.h_20,
                    width: Dimensions.h_20,
                    child: Image.asset(
                      Images.user,
                      color: AppColor.appColor,
                    )),
                icon: SizedBox(
                    height: Dimensions.h_20,
                    width: Dimensions.h_20,
                    child: Image.asset(Images.user)),
                title:  TutorLmsTextWidget(title: "Account",style: AppTextStyle.themeBoldNormalTextStyle(
                  fontSize: FontSize.sp_13,color: AppColor.appColor
                ),),
              ),
            ],
          )),
    );
  }
}
