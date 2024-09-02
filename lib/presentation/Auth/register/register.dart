import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import 'package:tutor_lms/presentation/Auth/register/register_controller.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import 'package:tutor_lms/widgets/tutor_textfield.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../../../constants/appcolor.dart';
import '../../../constants/apptextstyle.dart';
import '../../../constants/constants.dart';
import '../../../constants/fontsize.dart';
import '../../../widgets/spacing.dart';
import '../../../widgets/tutorlms_textbutton.dart';
import '../../../widgets/tutor_lms_passwordfield.dart';
import '../../validate/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final RegisterController registerController = Get.put(RegisterController());
WebViewPlusController? _controller;
double _height = Dimensions.h_100;
bool isVisible = false;
String? token;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TutorLmsConatiner(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: TutorLmsScaffold(
              body: GetBuilder<RegisterController>(
                  id: ControllerBuilders.registerController,
                  init: registerController,
                  builder: (controller) {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Form(
                            key: controller.registerKey,
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.w_20,right: Dimensions.w_20,top: Dimensions.h_70),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TutorLmsTextWidget(title: 'Register ', style: AppTextStyle.themeBoldTextStyle(
                                     fontSize: FontSize.sp_24,
                                     color: Theme.of(context).highlightColor
                                 )),
                                  ),
                                  VerticalSpacing(height: Dimensions.h_10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TutorLmsTextWidget(title: 'Welcome! Please create your account.', style: AppTextStyle.normalTextStyle(
                                        FontSize.sp_16,
                                         Theme.of(context).shadowColor
                                    )),
                                  ),
                                  TutorLmsConatiner(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        VerticalSpacing(height: Dimensions.h_20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TutorLmsTextWidget(title: 'First name', style:AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor)),
                                            HorizontalSpacing(width: Dimensions.w_100),
                                            TutorLmsTextWidget(title: 'Last name', style:AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor)),

                                          ],
                                        ),
                                        VerticalSpacing(height: Dimensions.h_5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: Dimensions.w_160,
                                              child: TutorLmsTextField(
                                                title: 'First Name',
                                                hintText: 'First Name',
                                                validator: Validator.nameValidate,
                                                controller: controller.nameController,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.w_150,
                                              child: TutorLmsTextField(
                                                title: 'Last Name',
                                                hintText: 'Last Name',
                                                validator: Validator.nameValidate,
                                                controller: controller.lastnameController,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TutorLmsTextWidget(title: 'Your Email', style:AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).shadowColor)),
                                        VerticalSpacing(height: Dimensions.h_5),
                                        TutorLmsTextField(
                                                title: 'Email',
                                                hintText: 'Email Address',
                                                validator: Validator.emailValidate,
                                                controller: controller.emailController
                                              ),
                                        TutorLmsTextWidget(title: 'Password', style:AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).shadowColor)),
                                        VerticalSpacing(height: Dimensions.h_5),
                                        TradeBitPasswordTextField(
                                          obscureText: controller.closeEye,
                                          title: 'Password',
                                          hintText: 'Password',
                                          controller: controller.passwordController,
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: IconButton(
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
                                        ),
                                        VerticalSpacing(height: Dimensions.h_10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.agreeButton();
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(top: 3),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: controller.agreeButtonTapped ? AppColor.appColor : AppColor.transparent,
                                                    border: Border.all(color: controller.agreeButtonTapped ? AppColor.appColor : Theme.of(context).shadowColor)),
                                                height: Dimensions.h_12,
                                                width: Dimensions.h_12,
                                              ),
                                            ),
                                            HorizontalSpacing(width: Dimensions.h_5),
                                            TutorLmsTextWidget(
                                                title: "By creating an account you have to agree ",
                                                style: AppTextStyle.bodyMediumTextStyle(
                                                    color: AppColor.greyColor)),

                                          ],
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left: Dimensions.w_18),
                                          child: TutorLmsTextWidget(
                                              title: "with our term & conditions.",
                                              style: AppTextStyle.bodyMediumTextStyle(
                                                color: AppColor.greyColor,

                                              )),
                                        ),
                                        VerticalSpacing(height: Dimensions.h_20),
                                        TutorLmsTextButton(
                                          loading: controller.isLoading,
                                          height: Dimensions.h_40,
                                          labelName: "Register",
                                          style: AppTextStyle.buttonTextStyle(
                                              color: AppColor.white),
                                          onTap: () {
                                            if(controller.registerKey.currentState!.validate())
                                              {
                                                setState(() {
                                                  isVisible = true;
                                                });
                                              }
                                            },
                                          margin: EdgeInsets.zero,
                                          color: AppColor.appColor,
                                        ),
                                        VerticalSpacing(height: Dimensions.h_15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            TutorLmsTextButton(
                                              borderRadius: BorderRadius.circular(30),
                                              color: AppColor.transparent,
                                              style: AppTextStyle.themeBoldNormalTextStyle(
                                                  fontSize: FontSize.sp_13,
                                                  color: AppColor.white
                                              ),
                                              labelName: 'Already have an account?',onTap: (){

                                            },),
                                            HorizontalSpacing(width: Dimensions.w_5),
                                            TutorLmsTextButton(
                                              borderRadius: BorderRadius.circular(30),
                                              color: AppColor.transparent,
                                              style: AppTextStyle.themeBoldNormalTextStyle(
                                                  fontSize: FontSize.sp_14,
                                                  color: AppColor.appColor
                                              ),
                                              labelName: ' Log In ',onTap: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
                                            },),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: Dimensions.h_100,
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
                                      onMessageReceived: (JavascriptMessage message) {
                                        setState(() {
                                          token = message.message;
                                          isVisible = false;
                                        });
                                        controller.registerByEmail(context, token.toString());
                                        print(message.message.toString());
                                      })
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}
