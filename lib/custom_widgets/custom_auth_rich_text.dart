import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:al_busayra_project/utils/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthRichTextWidget extends StatelessWidget {
  final String? normalText, linkText;
  final VoidCallback? onTap;
  final AlignmentGeometry? alignment;
  final Color? linkTextColor;

  const CustomAuthRichTextWidget(
      {this.alignment,
      this.normalText,
      this.linkText,
      this.onTap,
      this.linkTextColor});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: normalText,
        style: TextStyle(
            fontSize: 12.sp,
            //shadows: [Shadow(color: AppColors.THEME_COLOR_WHITE, offset: Offset(0, -1.4))],
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.w400,
            decorationThickness: 1.2,
            decorationColor: AppColors.kPrimaryColor,
            fontFamily: AppFonts.openSansRegular
            // fontFamily: AppFonts.Inter_Medium,
            ),
        children: [
          TextSpan(
            text: linkText,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              color: linkTextColor,
              fontFamily: AppFonts.openSansRegular,
              decorationColor: linkTextColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
      textScaleFactor: 1.01,
    );
  }
}
