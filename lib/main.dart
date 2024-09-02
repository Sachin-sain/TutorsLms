import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/presentation/getx/appPages.dart';
import 'approutes.dart';
import 'constants/Theme.dart';
import 'data.datasource/local/local_storage.dart';
import 'data.datasource/remote/services/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Stripe.publishableKey = "pk_live_51O9htkSHbw4fHYZc52jZyubrOADV7s8yOQGKCZgQohBjRO5wPjHEBDS8SpPqnXFyOfpZNr3uOxPvnNIJnn2IyfDYk00zg1PWQ13";
  await Stripe.instance.applySettings();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(Dimensions.defaultWidth, Dimensions.defaultHeight),
      minTextAdapt: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: LocalStorage().getTheme(),
          title: "Tutor Lms",
          initialRoute:  AppRoutes.splashScreen,
          getPages: AppPages.list,
        );
      },
    );
  }
}
