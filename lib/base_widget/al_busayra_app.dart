import 'package:al_busayra_project/controllers/global_controller.dart';
import 'package:al_busayra_project/custom_widgets/dismiss_keyboard.dart';
import 'package:al_busayra_project/routes/app_routes.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_constants.dart';
import 'package:al_busayra_project/utils/app_fonts.dart';
import 'package:al_busayra_project/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlBusayraApp extends StatefulWidget {
  const AlBusayraApp({super.key});

  @override
  State<AlBusayraApp> createState() => _AlBusayraAppState();
}

class _AlBusayraAppState extends State<AlBusayraApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<GlobalController>(
            init: GlobalController(),
            builder: (context) {
              return GetMaterialApp(
                navigatorKey: AppConstants.navigatorKey,
                navigatorObservers: [
                  KeyboardDismissalNavigatorObserver(),
                ],
                title: AppStrings.appTitle,
                scrollBehavior: CustomScrollBehavior(),
                theme: ThemeData(
                  useMaterial3: false,
                  primarySwatch: AppColors.kPrimaryColor,
                  scaffoldBackgroundColor: AppColors.transparentColor,
                  fontFamily: AppFonts.openSansRegular,
                ),
                debugShowCheckedModeBanner: false,
                getPages: AppRouter.routes,
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    child: widget!,
                  );
                },
              );
            });
      },
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
