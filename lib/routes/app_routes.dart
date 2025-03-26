import 'package:al_busayra_project/modules/auth/argument/login_argument.dart';
import 'package:al_busayra_project/modules/auth/screens/login_screen.dart';
import 'package:al_busayra_project/modules/auth/screens/otp_screen.dart';
import 'package:al_busayra_project/modules/home/screens/dashboard_screen.dart';
import 'package:al_busayra_project/modules/splash/screens/splash_screen.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    // ======================> Auth
    GetPage(
      name: AppRouteName.SPLASH_SCREEN_ROUTE,
      page: () => const SplashScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.LOGIN_SCREEN_ROUTE,
      page: () => LoginScreen(),
      curve: Curves.easeIn,
    ),
    //LoginArgument
    GetPage(
      name: AppRouteName.OTP_SCREEN_ROUTE,
      page: () {
        LoginArgument? loginArgument = Get.arguments as LoginArgument?;
        return OtpScreen(
          eployeeId: loginArgument?.eployeeId ?? "",
        );
      },
      curve: Curves.easeIn,
    ),
    // ======================> Core
    GetPage(
      name: AppRouteName.DASHBOARD_HOME_SCREEN_ROUTE,
      page: () => const DashboardScreen(),
      curve: Curves.easeIn,
    ),
    //Terms and Conditions
    // GetPage(
    //   name: AppRouteName.CONTENT_SCREEN_ROUTE,
    //   page: () {
    //     ContentArgument? contentArgument = Get.arguments as ContentArgument?;
    //     return ContentScreen(
    //       contentType: contentArgument?.content ?? "",
    //       title: contentArgument?.title ?? "",
    //     );
    //   },
    //   curve: Curves.easeIn,
    // ),
  ];
}
