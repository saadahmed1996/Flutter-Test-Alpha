import "package:al_busayra_project/utils/app_colors.dart";
import "package:al_busayra_project/utils/app_fonts.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

///Custom Button used in App
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonColor,
    required this.onTap,
    required this.buttonText,
    this.icon,
    this.iconColor,
    this.padding,
    this.height,
    this.containsIcon = false,
    this.fontFamily,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.lowerGradientColor,
    this.upperGradientColor,
    this.showBorder,
    this.borderColor,
    this.borderRadius = 10,
    this.borderInsideColor,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final Function()? onTap;
  final bool containsIcon;
  final String? icon;
  final Color? iconColor;

  final double fontSize;
  final double? height;
  final double? padding;
  final String? fontFamily;
  final Color? upperGradientColor;
  final Color? lowerGradientColor;
  final bool? showBorder;
  final double borderRadius;
  final Color? borderColor;
  final Color? borderInsideColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 50.h,
          // width: 250.w,
          padding: EdgeInsets.symmetric(horizontal: padding ?? 20).w,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     upperGradientColor ?? AppColors.kPrimaryColor,
            //     lowerGradientColor ?? AppColors.kPrimaryColor.shade700,
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            border: Border.all(color: borderColor ?? AppColors.kPrimaryColor),
            color: showBorder ?? false
                ? borderInsideColor ?? AppColors.whiteColor
                : buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: containsIcon
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText,
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize.sp,
                        fontFamily: fontFamily ?? AppFonts.openSansRegular,
                        fontWeight: fontWeight,
                      ),
                    ),
                    10.horizontalSpace,
                    Image.asset(
                      icon ?? "",
                      // height: 16.h,
                      scale: 3.5.sp,
                      color: iconColor ?? AppColors.whiteColor,
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: showBorder ?? false
                          ? AppColors.kPrimaryColor
                          : textColor,
                      fontSize: fontSize.sp,
                      fontFamily: fontFamily ?? AppFonts.openSansRegular,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
        ));
  }
}
