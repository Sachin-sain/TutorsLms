import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tutor_lms/presentation/change_password/change_password.dart';
import '../../approutes.dart';
import '../../constants/constants.dart';
import '../../data.datasource/local/local_storage.dart';
import '../Auth/Forget_password/forgot_password.dart';
import '../Auth/login/login.dart';
import '../Auth/login_selection_page/loginselectionpage.dart';
import '../Auth/register/register.dart';
import '../Homepage/homepage.dart';
import '../dashboard/dashboard.dart';
import '../onboardingScreen/onboradingScreen.dart';
import '../splash/splash.dart';

class AppPages {
  static const Duration duration = Duration(milliseconds: 500);
  static const Transition transition = Transition.cupertino;
  static var list = [
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.onBoarding,
      page: () =>  LocalStorage.getBool(GetXStorageConstants.onBoarding) == true ? const LoginSelectionPage() :  OnBoardingScreen(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.loginSelection,
      page: () =>  const LoginSelectionPage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.loginScreen,
      page: () => const Login(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.forgotPage,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.changePassword,
      page: () => const ChangePassword(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.dashBoard,
      page: () =>  const DashBoard(),
    ),
    GetPage(
      transitionDuration: duration,
      transition: transition,
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),

  ];
}
