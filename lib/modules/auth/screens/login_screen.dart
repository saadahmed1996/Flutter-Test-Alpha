import 'dart:io';
import 'package:al_busayra_project/controllers/auth_controller.dart';
import 'package:al_busayra_project/custom_widgets/common_scaffold.dart';
import 'package:al_busayra_project/custom_widgets/custom_button.dart';
import 'package:al_busayra_project/custom_widgets/custom_text.dart';
import 'package:al_busayra_project/custom_widgets/custom_textfield.dart';
import 'package:al_busayra_project/modules/auth/argument/login_argument.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_constants.dart';
import 'package:al_busayra_project/utils/app_dialogs.dart';
import 'package:al_busayra_project/utils/app_fonts.dart';
import 'package:al_busayra_project/utils/app_navigation.dart';
import 'package:al_busayra_project/utils/field_validation.dart';
import 'package:al_busayra_project/utils/regular_expression.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController employeeIdController = TextEditingController();
  GlobalKey<FormState> authForm = GlobalKey<FormState>();

  void login() async {
    AppConstants.unFocusKeyboardMethod(
      context: AppConstants.navigatorKey.currentContext!,
    );

    if (authForm.currentState!.validate()) {
      final String enteredEmployeeId = employeeIdController.text.trim();

      // Show progress dialog
      AppDialogs.progressAlertDialog(
          context: AppConstants.navigatorKey.currentContext!);

      try {
        // Call AuthController's login logic
        bool isLoginSuccessful = await AuthController.i.validateEmployeeId(
          enteredEmployeeId,
        );

        // Close progress dialog
        Navigator.of(AppConstants.navigatorKey.currentContext!,
                rootNavigator: true)
            .pop();

        // Handle result
        if (isLoginSuccessful) {
          AppNavigation.navigateReplacementNamed(
            AppConstants.navigatorKey.currentContext!,
            AppRouteName.OTP_SCREEN_ROUTE,
            arguments: LoginArgument(eployeeId: enteredEmployeeId),
          );
        } else {
          AppDialogs.showToast(message: "Invalid Employee ID");
        }
      } catch (e) {
        // Close progress dialog on error
        Navigator.of(AppConstants.navigatorKey.currentContext!,
                rootNavigator: true)
            .pop();
        AppDialogs.showToast(message: "Failed to load data. Please try again.");
      }
    }
  }

  DateTime? lastPressed;
  Future<bool> handleWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 2)) {
      lastPressed = now;
      AppDialogs.showToast(
        message: "Press back again to exit",
      );
      return Future.value(false);
    }
    SystemNavigator.pop();
    exit(0);

    // return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isRegistration: true,
      child: WillPopScope(
        onWillPop: () async {
          return handleWillPop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.verticalSpace,
                Image.asset(AssetPaths.APP_LOGO, scale: 3.8.sp),
                40.verticalSpace,
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(27.sp)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                child: Image.asset(AssetPaths.CURVE_IMAGE),
                              ),
                              Positioned.fill(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 30.0,
                                ),
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                      text: "Login your account",
                                      color: AppColors.whiteColor,
                                      fontsize: 20.sp,
                                      fontFamily: AppFonts.publicSansBold,
                                    ),
                                    10.verticalSpace,
                                    CustomText(
                                      text:
                                          "Please use your employee id provided by your organization to log in.",
                                      color: AppColors.whiteColor,
                                      fontsize: 14.sp,
                                      fontFamily: AppFonts.publicSansRegular,
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: authForm,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: "Employee ID",
                                        fontsize: 14.sp,
                                        fontFamily: AppFonts.publicSansMedium,
                                      ),
                                      CustomText(
                                        text: "*",
                                        color: AppColors.redColor,
                                      ),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  CustomTextField(
                                    hintText: "Enter Employee ID",
                                    filled: true,
                                    prefixIconColor: AppColors.kPrimaryColor,
                                    textInputFormattors: [
                                      LengthLimitingTextInputFormatter(
                                          AppConstants.EMAIL_MAX_LENGTH),
                                      FilteringTextInputFormatter.deny(
                                        RegularExpressions.DISALLOW_SPACES,
                                      ),
                                    ],
                                    keyboardType: TextInputType.emailAddress,
                                    textEditingController: employeeIdController,
                                    validator: (val) {
                                      return Validation
                                          .employeeIdValidationMethod(
                                        fieldName: "Employee ID",
                                        value: val!,
                                      );
                                    },
                                  ),
                                  20.verticalSpace,
                                  CustomButton(
                                    buttonColor: AppColors.kPrimaryColor,
                                    onTap: () {
                                      login();
                                    },
                                    buttonText: "Login",
                                    containsIcon: true,
                                    icon: AssetPaths.LOGIN_BTN_ICON,
                                  ),
                                  30.verticalSpace,
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
