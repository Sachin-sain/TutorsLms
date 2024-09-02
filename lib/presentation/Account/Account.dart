import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/apptextstyle.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/presentation/Account/my_learning/myleraning.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import 'package:tutor_lms/presentation/Purchasehistory/purchase_history.dart';
import 'package:tutor_lms/presentation/change_password/change_password.dart';
import 'package:tutor_lms/presentation/membership/membershipplan.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../../constants/constants.dart';
import '../../constants/images.dart';
import '../../data.datasource/local/local_storage.dart';
import '../Homepage/home_controller.dart';
import '../Notification/Notification.dart';
import '../User_profile/user_profile.dart';
import '../frequent.dart';
class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final HomepageController nameController = Get.put(HomepageController());
  bool day =false;
  @override
  void initState() {
    nameController.onProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TutorLmsTextWidget(title: 'Account', style: AppTextStyle.themeBoldTextStyle(fontSize : FontSize.sp_22,color: Theme.of(context).highlightColor)),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: (){
                       LocalStorage.getBool(GetXStorageConstants.userLogin) == true ?
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()))
                           : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Profile()));
                    },
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    leading: Image.asset(Images.instructor,scale: 1,),
                    title: TutorLmsTextWidget(title: controller.user?.firstName ?? 'Hello',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),),
                    subtitle: TutorLmsTextWidget(title: controller.user?.email ?? 'User',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),
                  VerticalSpacing(height: Dimensions.h_10),
                  Divider(
                    color: Theme.of(context).shadowColor,
                  ),
                  ListTile(
                    onTap: (){
                      LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login())) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyLearning()));
                    },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: Image.asset(Images.mylearning),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'My Learings',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                    subtitle: TutorLmsTextWidget(title: 'Keep track of all your learnings',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),
                  ListTile(
                    onTap: (){
                      LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login())) :
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const PurchaseHistory()));
                    },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: Image.asset(Images.purchasehistory),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'Purchase History',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                    subtitle: TutorLmsTextWidget(title: 'All transactions in one place',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MemberShip()));
                    },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: const Icon(Icons.add),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'MemberShip',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                    subtitle: TutorLmsTextWidget(title: 'Choose Membership Plan',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),
                  ListTile(
                    onTap: (){
                      LocalStorage.writeBool(GetXStorageConstants.exchangeFromHome, true);
                      LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()))
                          : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const TutorNotification()));
                    },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: Image.asset(Images.tutornotification),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'Notifications',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                    subtitle: TutorLmsTextWidget(title: 'Get real time updates',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),ListTile(
                    onTap: (){
                      LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login())) :
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const ChangePassword()));
                    },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: Image.asset(Images.Changepassword),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'Change Password',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                    subtitle: TutorLmsTextWidget(title: 'Create strong password & keep secure',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor),),
                  ),
              //     ListTile(
              //        title: TutorLmsTextWidget(
              //             title: LocalStorage.getBool(GetXStorageConstants.day) == true ? "Light Mode" : "Dark Mode",
              //             style: AppTextStyle.normalTextStyle(
              //                 FontSize.sp_16, Theme.of(context).highlightColor)),
              //     leading: Icon(LocalStorage.getBool(GetXStorageConstants.day) == true ? Icons.light_mode:Icons.dark_mode,color: Theme.of(context).shadowColor,),
              //     trailing:  Transform.scale(
              //       alignment: Alignment.centerRight,
              //       scale: 0.8,
              //       child: CupertinoSwitch(
              //         value: LocalStorage.getBool(GetXStorageConstants.day),
              //         onChanged: (value){
              //           setState(() {
              //             LocalStorage().changeTheme();
              //             LocalStorage.writeBool(GetXStorageConstants.day,value);
              //           },
              //           );
              //         },
              //         thumbColor: AppColor.appColor,
              //         activeColor: AppColor.appColor,
              //       ),
              //     ),
              // ),
                  LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? SizedBox.shrink() : ListTile(
                    onTap: ()async {
                      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
                      LocalStorage.clearValueByKey(GetXStorageConstants.authToken);
                      LocalStorage.writeBool(GetXStorageConstants.userLogin, true);
                      },
                    leading: Icon(Icons.logout,color: Theme.of(context).shadowColor,),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'Logout',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),

                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const frequent()));
                      },
                    leading:Padding(
                      padding:  EdgeInsets.only(top: Dimensions.h_8),
                      child: Image.asset(Images.google,scale: 1.5,),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,

                      color: Theme.of(context).shadowColor,size: 15,),
                    title: TutorLmsTextWidget(title: 'FAQ',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                  ),
              ]
            ),
            )
          ),
        );
      },

    );
  }
}
