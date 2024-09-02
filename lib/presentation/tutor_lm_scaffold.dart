import 'package:flutter/material.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../constants/appcolor.dart';
import '../constants/images.dart';

class TutorLmsScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final Color? safeAreaColor;
  final PreferredSizeWidget? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool extendBodyBehindAppBar;
  final bool isLoading;
  final Widget? floatingActionButton;
  const TutorLmsScaffold(
      {Key? key,
        required this.body,
        this.backgroundColor,
        this.bottomNavigationBar,
        this.drawer,
        this.appBar,
        this.safeAreaColor,
        this.endDrawer,
        this.scaffoldKey,
        this.extendBodyBehindAppBar = false,
        this.isLoading = false,
       this.floatingActionButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OverlayLoaderWithAppIcon(
      borderRadius: 8,
      appIconSize: 50,
      overlayOpacity: 0.5,
      overlayBackgroundColor: AppColor.transparent,
      circularProgressColor: AppColor.appColor,
      isLoading: isLoading,
      appIcon: Image.asset(Images.appIcon),
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        drawerEnableOpenDragGesture: false,
        endDrawer: endDrawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        body: body,
        key: scaffoldKey,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        extendBody: true,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
