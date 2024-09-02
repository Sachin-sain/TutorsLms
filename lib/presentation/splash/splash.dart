import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutor_lms/data.datasource/remote/services/apis.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/presentation/onboardingScreen/onboradingScreen.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import '../../constants/constants.dart';
import '../../constants/images.dart';
import '../../data.datasource/local/local_storage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    await checkLogin();
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      LocalStorage.getBool(GetXStorageConstants.onBoarding) == true ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  DashBoard())) :
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));
    });
  }

  checkLogin() async {
    print('wwwwwwwwwwwwwwwwwwwwwwww');
    final client = Dio();
    try{
      final res = await client.get(Apis.dashboardapi,options: Options(headers:{"Authorization":LocalStorage.getAuthToken()},));
     if(res.statusCode == 200 ) {
       LocalStorage.writeBool(GetXStorageConstants.userLogin, false);
       LocalStorage.writeBool(GetXStorageConstants.jwtExpired, false);
     }

    }  catch (e) {
      if (e is DioError && e.response?.statusCode == 400) {
        if (e.response?.data["message"] == 'jwt must be provided') {
          print(e.response?.data["message"]);
          LocalStorage.writeBool(GetXStorageConstants.userLogin, true);
        }
        if(e.response?.data['message'] == 'jwt expired') {
          LocalStorage.writeBool(GetXStorageConstants.jwtExpired, true);
        }
  }}}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const TutorLmsScaffold(
        body: TutorLmsConatiner(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Images.splash),
            )
          ),
        ),
      ),
    );
  }
}

