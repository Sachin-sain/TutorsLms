import 'package:flutter/material.dart';
import 'package:tutor_lms/constants/fontsize.dart';
import 'package:tutor_lms/presentation/tutor_lm_scaffold.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import '../../approutes.dart';
import '../../constants/images.dart';
import '../../widgets/onbording/onboarding.dart';
import '../../widgets/onbording/onboardingscreen.dart';

class OnBoardingScreen extends StatelessWidget {
 OnBoardingScreen({Key? key}) : super(key: key);

  final List<OnboardingData> onBoarding = [
    OnboardingData(imagePath: Images.onboarding1),
    OnboardingData(imagePath: Images.onboarding2),
    OnboardingData(imagePath: Images.onboarding3),

  ];

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => false,
      child: TutorLmsConatiner(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.onboarding1,),
          )
        ),
        child: TutorLmsScaffold(
          body: IntroScreen(onBoarding,AppRoutes.loginScreen),
        ),
      ),
    );
  }
}
