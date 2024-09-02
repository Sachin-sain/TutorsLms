import 'package:flutter/material.dart';
import 'appcolor.dart';

class AppTheme {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColor.appColor,
    // backgroundColor: AppColor.lightBackground,
    highlightColor: AppColor.black,
    canvasColor: AppColor.neutral_500,
    shadowColor: AppColor.textColor,
    scaffoldBackgroundColor: AppColor.lightBackground,
    cardColor: AppColor.lightCardColor.withOpacity(0.6),
    disabledColor: AppColor.lightCardColor,
    hoverColor: AppColor.lightCardColor,
    focusColor: AppColor.black,
    splashColor: AppColor.white,
    hintColor: AppColor.white,
    // bottomAppBarColor: AppColor.userWhite,
    primaryColorDark: AppColor.userWhite,
  );

  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: AppColor.appColor,
      // backgroundColor: AppColor.darkCardColor,
      highlightColor: AppColor.white,
      canvasColor: AppColor.white,
      shadowColor: AppColor.textColor,
      scaffoldBackgroundColor: AppColor.darkScaffold,
      cardColor: AppColor.darkCardColor,
      disabledColor: AppColor.containerDark,
      hoverColor: AppColor.darkScaffold,
      focusColor: AppColor.white,
      splashColor: AppColor.black,
      hintColor: AppColor.darkCardColor,
      // bottomAppBarColor: AppColor.textField,
      primaryColorDark: AppColor.user
  );
}
