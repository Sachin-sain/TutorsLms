
class Constants {
  static const  responseError = 'ERROR';
  static const responseSuccess = 'SUCCESS';
  static const someThingWentWrong = 'Something went wrong.';
  static const reCaptchaSiteKey = '6LdpybgmAAAAAISLIzZ5Orj6922divJgT3_EeYJh';
  static const STRIPE_SECRET_KEY =  "";
  static const STRIPE_PUBLISHABLE_KEY = "pk_test_51O7C8YSJ6J0kOf48DKKK0H0d4rwD9HWBxygBRadjmojPDRsoPUF7Vg7s4IsvUwHZr7m381mnpJlbaajDVT9YYJl700zkyvhbA3";

}

class GetXStorageConstants {
  static const authToken = "Authorization";
  static const skip = "Skip";
  static const darkTheme = "DarkTheme";
  static const profileStatus = "ProfileStatus";
  static const userEmail = 'UserEmail';
  static const userMobile = 'UserMobile';
  static const userProfile = 'userProfile';
  static const enroll = 'enroll';
  static const userName = 'userName';
  static const user = 'user';
  static const onBoarding = 'onBoarding';
  static const isLogin = 'isLogin';
  static const userLogin = 'userLogin';
  static const jwtExpired = 'jwtExpired';
  static const home = 'Home';
  static const stakingDeposit = 'stakingDeposit';
  static const searchFromHome = 'searchFromHome';
  static const withdrawFromHome = 'withdrawFromHome';
  static const depositFromHome = 'depositFromHome';
  static const transferFromHome = 'transferFromHome';
  static const exchangeFromHome = 'exchangeFromHome';
}

class ControllerBuilders {
  static String loginPageController = 'LoginPageController';
  static String courseController = 'courseController';
  static String otpPageController = 'OtpPageController';
  static String registerController = 'RegisterController';
  static String forgotController = 'ForgotController';
  static String homeController = 'HomeController';
  static String learningController = 'LearningController';
  static String onBoardingController = 'onBoardingController';
  static String exchangeController = 'exchangeController';
  static String marketController = 'marketController';
  static String withdrawController = 'withdrawController';
  static String depositController = 'depositController';
  static String depositWithdrawController = 'depositWithdrawController';
  static String transferController = 'transferController';
  static String historyController = 'historyController';
  static String notificationController = 'notificationController';
  static String stakingController = 'stakingController';
  static String memberShipController = 'MemberShipController';
  static String changePasswordController = 'changePasswordController';
  static String userProfileController = 'changePasswordController';
  static String securityController = 'securityController';
  static String sendTokenController = 'sendTokenController';
  static String dashboardController = 'dashboardController';
  static String ticketController = 'ticketController';
}

class ApiStatus {
  static const  success = "Success";
  static const failed = "Failed";
}

class FontFamily {
  static const poppins = 'Poppins';
}

class MenuItem {
  final String name;
  final String image;

  MenuItem({required this.name,required this.image});
}
