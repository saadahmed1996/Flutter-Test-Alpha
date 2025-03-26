import 'dart:async';
import 'package:al_busayra_project/controllers/global_controller.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_constants.dart';
import 'package:al_busayra_project/utils/app_navigation.dart';
import 'package:al_busayra_project/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer splashTimer;

  @override
  void initState() {
    splashTimer = Timer(
      const Duration(seconds: 3),
      () {
        GlobalController.i.initShared();
        GlobalController.i.loadCurrentUserFromSharedPreference(
            context: AppConstants.navigatorKey.currentContext!);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    splashTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    ScreenSize.screenSizeMethod(context: context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: Center(
          child: Image.asset(
            AssetPaths.APP_LOGO,
            color: AppColors.kPrimaryColor,
            scale: 3.8.sp,
          ),
        ),
      ),
    );
  }
}
