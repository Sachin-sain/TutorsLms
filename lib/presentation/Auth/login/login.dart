import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/images.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/presentation/Auth/register/register.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import 'package:tutor_lms/widgets/tutor_textfield.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../../../approutes.dart';
import '../../../constants/appcolor.dart';
import '../../../constants/apptextstyle.dart';
import '../../../constants/constants.dart';
import '../../../constants/fontsize.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/tutorlms_textbutton.dart';
import '../../../widgets/tutor_lms_passwordfield.dart';
import '../../validate/validators.dart';
import 'login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginPageController = Get.put(LoginController());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  WebViewPlusController? _controller;
  double _height = Dimensions.h_100;
  bool isVisible = true;
  String? token;
  bool loading = false;
  
 @override
  void initState() {
     load();
    super.initState();
  }

  load() async {
   return Timer(const Duration(milliseconds: 5), () {
     LocalStorage.getBool(GetXStorageConstants.isLogin) == true ?
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const DashBoard(index: 0))) : null;
   });
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
        init: _loginPageController,
        id: ControllerBuilders.loginPageController,
        builder: (controller) {
          return Stack(
            children: [
              TutorLmsConatiner(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor
                ),
                child: SafeArea(
                  child: WillPopScope(
                    onWillPop: () async => false,
                    child: TutorLmsScaffold(
                      isLoading: controller.loading,
                      // appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_50),
                      // child: const TutorLmsAppbar()),
                      body: Form(
                        key: loginKey,
                        child:  SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: Dimensions.w_25,right: Dimensions.w_25,top:Dimensions.h_70),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: TutorLmsTextWidget(title: 'Login', style: AppTextStyle.themeBoldTextStyle(
                                          fontSize: FontSize.sp_24,
                                          color: Theme.of(context).highlightColor
                                      )),
                                    ),
                                    VerticalSpacing(height: Dimensions.h_5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: TutorLmsTextWidget(title: 'Welcome! Please Login to your account', style: AppTextStyle.normalTextStyle(
                                          FontSize.sp_13,
                                          Theme.of(context).shadowColor
                                      )),
                                    ),
                                    TutorLmsConatiner( decoration:
                                    const BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                        child:Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            VerticalSpacing(height: Dimensions.h_30),
                                            TutorLmsTextWidget(title: 'Your Email', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                                            VerticalSpacing(height: Dimensions.h_5),
                                            TutorLmsTextField(
                                              title: 'Email',
                                              hintText: 'Email',
                                              validator: Validator.emailValidate,
                                              controller: controller.emailTextController,
                                            ),
                                            VerticalSpacing(height: Dimensions.h_5),
                                            TutorLmsTextWidget(title: 'Password', style:AppTextStyle.normalTextStyle(FontSize.sp_13, Theme.of(context).shadowColor)),
                                            VerticalSpacing(height: Dimensions.h_5),
                                            TradeBitPasswordTextField(
                                              onEditingComplete: () {
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              },
                                              obscureText: controller.closeEye,
                                              title: 'Password',
                                              hintText: 'Password',
                                              controller: controller.passwordTextController,
                                              suffixIcon: IconButton(
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onPressed: () {
                                                    controller.changeEye();
                                                  },
                                                  icon: Icon(
                                                      controller.closeEye
                                                          ? Icons.visibility
                                                          : Icons.visibility_off,
                                                      color: Theme.of(context).shadowColor.withOpacity(0.4))),
                                            ),
                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(AppRoutes.forgotPage);
                                                  },
                                                  child: TutorLmsTextWidget(
                                                      title: "Forgot password?",
                                                      style: AppTextStyle.themeBoldTextStyle(
                                                          fontSize: FontSize.sp_15,
                                                          color: AppColor.appColor)),
                                                )),
                                            VerticalSpacing(height: Dimensions.h_15),
                                            TutorLmsTextButton(
                                              loading: controller.isLoading,
                                              labelName: "Login",
                                              style: AppTextStyle.buttonTextStyle(
                                                  color: AppColor.white),
                                              onTap: () {
                                                if (loginKey.currentState!.validate()) {
                                                  setState(() {
                                                    isVisible = true;
                                                  });
                                                  }
                                                },
                                              margin: EdgeInsets.zero,
                                              color: AppColor.appColor,
                                            ),
                                          ],
                                        )),
                                    VerticalSpacing(height: Dimensions.h_20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TutorLmsTextButton(
                                          borderRadius: BorderRadius.circular(30),
                                          color: AppColor.transparent,
                                          style: AppTextStyle.themeBoldNormalTextStyle(
                                              fontSize: FontSize.sp_14,
                                              color: AppColor.white
                                          ),
                                          labelName: "Don't have an account ?",onTap: (){
                                          Get.toNamed(AppRoutes.loginScreen);
                                        },),
                                        HorizontalSpacing(width: Dimensions.w_5),
                                        TutorLmsTextButton(
                                          borderRadius: BorderRadius.circular(30),
                                          color: AppColor.transparent,
                                          style: AppTextStyle.themeBoldNormalTextStyle(
                                              fontSize: FontSize.sp_14,
                                              color: AppColor.appColor
                                          ),
                                          labelName: ' Create Account ',onTap: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                                        },),
                                      ],
                                    ),
                                    VerticalSpacing(height: Dimensions.h_10),
                                    TutorLmsTextWidget(
                                        title: "Sign in With",
                                        style: AppTextStyle.themeBoldNormalTextStyle(
                                            fontSize: FontSize.sp_13,
                                            color: Theme.of(context).highlightColor)),
                                    VerticalSpacing(height: Dimensions.h_10),
                                    GestureDetector(
                                      onTap: () {
                                        controller.loginWithGoogle(context);

                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(Dimensions.h_10),
                                        height: Dimensions.h_45,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).shadowColor.withOpacity(0.2),
                                           shape: BoxShape.circle
                                          ),
                                          child: Image.asset(Images.googleSign)),
                                    ),
                                    VerticalSpacing(height: Dimensions.h_20),
                                    GestureDetector(
                                      onTap: () {
                                        LocalStorage.writeBool(GetXStorageConstants.skip, true);
                                         LocalStorage.writeBool(GetXStorageConstants.userLogin, true);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard()));
                                      },
                                      child: TutorLmsTextWidget(title: 'Skip', style: AppTextStyle.themeBoldNormalTextStyle(
                                        fontSize: FontSize.sp_13,
                                        color: Theme.of(context).highlightColor
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Dimensions.h_150,
                right: Dimensions.w_15,
                child: Visibility(
                  visible: isVisible,
                  child: SizedBox(
                     width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.sizeOf(context).height  * 0.80,
                    child: WebViewPlus(
                      zoomEnabled: true,
                      gestureNavigationEnabled: true,
                      backgroundColor: Colors.transparent,
                      allowsInlineMediaPlayback: true,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        _controller = controller;
                        controller.loadUrl('assets/index.html');
                      },
                      onPageFinished: (url) {
                        _controller?.getHeight().then((double height) {
                          print("Height:  " + height.toString());
                          setState(() {
                            _height = height;
                          });
                        });
                      },
                      javascriptChannels: {
                        JavascriptChannel(
                            name: 'Captcha',
                            onMessageReceived: (JavascriptMessage message) async {
                              setState(() {
                                token = message.message;
                                isVisible = false;
                              });
                              await controller.login(context, token.toString());
                              print(message.message.toString());
                            })
                      },

                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }
}




