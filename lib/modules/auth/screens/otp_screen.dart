// ignore_for_file: use_build_context_synchronously, null_argument_to_non_null_type

import 'dart:async';
import 'package:al_busayra_project/controllers/auth_controller.dart';
import 'package:al_busayra_project/controllers/global_controller.dart';
import 'package:al_busayra_project/custom_widgets/common_scaffold.dart';
import 'package:al_busayra_project/custom_widgets/custom_auth_rich_text.dart';
import 'package:al_busayra_project/custom_widgets/custom_button.dart';
import 'package:al_busayra_project/custom_widgets/custom_keyboard_action.dart';
import 'package:al_busayra_project/custom_widgets/custom_pin_code.dart';
import 'package:al_busayra_project/custom_widgets/custom_text.dart';
import 'package:al_busayra_project/models/user_model.dart';
import 'package:al_busayra_project/routes/app_routes_name.dart';
import 'package:al_busayra_project/services/local_storage.dart';
import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_constants.dart';
import 'package:al_busayra_project/utils/app_dialogs.dart';
import 'package:al_busayra_project/utils/app_fonts.dart';
import 'package:al_busayra_project/utils/app_navigation.dart';
import 'package:al_busayra_project/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, this.eployeeId});

  String? eployeeId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController employeeIdController = TextEditingController();

  void onOtpSubmit({required String employeeId, required String otp}) async {
    if (pinTextEditingController.text.isEmpty) {
      AppDialogs.showToast(message: "Please enter OTP");
    } else if (isCodeExpired == true) {
      AppDialogs.showToast(message: AppStrings.CODE_EXPIRED_ERROR);
    } else {
      AppDialogs.progressAlertDialog(context: context);
      await Future.delayed(const Duration(seconds: 3));
      bool isOtpValid = await AuthController.i.verifyOtp(employeeId, otp);
      AppNavigation.navigatorPop(context);
      if (isOtpValid) {
        List<UserModel> users = await AuthController.i.loadUsers();
        UserModel? user = users.firstWhere(
          (user) => user.employeeId == employeeId,
          orElse: () => UserModel(),
        );
        if (user.employeeId != null) {
          await SharedPreference().setUser(user);
          GlobalController.i.currentUser.value = user;
          AppDialogs.showToast(message: "✅ Welcome back, ${user.firstName}!");
          AppNavigation.navigateReplacementNamed(
            context,
            AppRouteName.DASHBOARD_HOME_SCREEN_ROUTE,
          );
        }
      } else {
        AppDialogs.showToast(message: "❌ Invalid OTP. Please try again.");
      }
    }
  }

  late int _secondsLeft;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = 59;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          isTimeComplete = true;
          isCodeExpired = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool isCodeExpired = false;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isRegistration: true,
      leading: AssetPaths.BACK_ARROW_ICON,
      onclickLead: () => AppNavigation.navigateReplacementNamed(
          context, AppRouteName.LOGIN_SCREEN_ROUTE),
      child: WillPopScope(
        onWillPop: () async {
          AppNavigation.navigateReplacementNamed(
              context, AppRouteName.LOGIN_SCREEN_ROUTE);
          return Future.value();
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
                                  children: [
                                    CustomText(
                                      text: "Just one more step",
                                      color: AppColors.whiteColor,
                                      fontsize: 20.sp,
                                      fontFamily: AppFonts.publicSansBold,
                                    ),
                                    10.verticalSpace,
                                    CustomText(
                                      text:
                                          "We've sent a code to your email john.smith@albusayra.",
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
                            child: Column(
                              children: [
                                CustomText(
                                  text:
                                      "Please check your inbox and insert the code below to sign in.",
                                  fontsize: 12.sp,
                                  fontFamily: AppFonts.publicSansMedium,
                                  color: const Color(0xff707070),
                                ),
                                10.verticalSpace,
                                pinField(context: context),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "Time left    ",
                                      color: AppColors.blackColor,
                                      fontsize: 14.sp,
                                      fontFamily: AppFonts.publicSansRegular,
                                      isLeftAlign: false,
                                    ),
                                    CustomText(
                                      text:
                                          AppConstants.formatTime(_secondsLeft),
                                      color: Colors.blue,
                                      fontsize: 14.sp,
                                      fontFamily: AppFonts.publicSansRegular,
                                      isLeftAlign: false,
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                CustomButton(
                                  buttonColor: AppColors.kPrimaryColor,
                                  onTap: () {
                                    onOtpSubmit(
                                      employeeId: widget.eployeeId ?? "",
                                      otp: pinTextEditingController.text.trim(),
                                    );
                                  },
                                  buttonText: "Submit",
                                  containsIcon: true,
                                  icon: AssetPaths.LOGIN_BTN_ICON,
                                ),
                                20.verticalSpace,
                                _didNotReceiveCodeText(context: context),
                                30.verticalSpace,
                              ],
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

  FocusNode pincodeFoucus = FocusNode();

  TextEditingController pinTextEditingController = TextEditingController();

  Widget pinField({required BuildContext context}) {
    return CustomKeyboardActionWidget(
      focusNode: pincodeFoucus,
      child: CustomPinCodeField(
        focusNode: pincodeFoucus,
        controller: pinTextEditingController,
        onChanged: (value) {
          // print(value);
        },
        onCompleted: (v) {
          //For Auto Complete
        },
      ),
    );
  }

  bool isTimeComplete = false;

  Widget _didNotReceiveCodeText({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CustomAuthRichTextWidget(
        normalText: AppStrings.codeDidntReceiveCode,
        linkText: AppStrings.resend,
        linkTextColor: isTimeComplete ? AppColors.kPrimaryColor : Colors.grey,
        onTap: () {
          if (isTimeComplete) {
            _resendOtpMethod(context: context);
          }
        },
      ),
    );
  }

  void _resendOtpMethod({required BuildContext context}) {
    pinTextEditingController.clear();
    _resendOtpApiMethod(context: context);
    setState(() {
      isTimeComplete = false;
      isCodeExpired = false;
      _secondsLeft = 59;
    });
    _startTimer();
  }

  void _resendOtpApiMethod({required BuildContext context}) {
    _keyBoardUnFocusMethod(context: context);
    _startTimer();
  }

  void _keyBoardUnFocusMethod({required BuildContext context}) {
    AppConstants.unFocusKeyboardMethod(context: context);
  }
}
