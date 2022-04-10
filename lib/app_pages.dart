import 'package:assignmennt/approutes.dart';
import 'package:assignmennt/core/controllers/main_controller.dart';
import 'package:assignmennt/screens/landing_page.dart';
import 'package:assignmennt/screens/login_page.dart';
import 'package:assignmennt/screens/otp_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      transition: Transition.leftToRight,
      binding: BindingsBuilder(() {
        Get.put(MainController(), permanent: true);
      }),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpPage(),
    )
  ];
}
