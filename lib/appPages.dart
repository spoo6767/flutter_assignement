import 'package:assignmennt/approutes.dart';
import 'package:assignmennt/screens/landibgPage.dart';
import 'package:assignmennt/screens/loginPage.dart';
import 'package:assignmennt/screens/otpPage.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppRoutes.login, page: () => const LogiNPage(),
    transition: Transition.leftToRight,binding: BindingsBuilder((){})),
    GetPage(name: AppRoutes.landing, page: () => const LandingPage()),
    GetPage(name: AppRoutes.otp, page: () => const OtpPage())
  ];
}
