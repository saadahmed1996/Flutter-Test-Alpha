import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  void Function(String) onChanged;
  void Function(String)? onCompleted;
  FocusNode? focusNode;
  final TextEditingController? controller;
  CustomPinCodeField({
    Key? key,
    required this.onChanged,
    this.controller,
    this.onCompleted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: const TextStyle(
        color: Color(0xffF6134B),
        fontWeight: FontWeight.bold,
      ),
      autoFocus: true,
      focusNode: focusNode,
      cursorColor: AppColors.kPrimaryColor,
      length: 6,
      obscureText: false,
      obscuringCharacter: '*',
      hintCharacter: '-',
      // keyboardType: TextInputType.number,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
      animationType: AnimationType.fade,
      autoDisposeControllers: false,
      pinTheme: PinTheme(
          fieldOuterPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5.0),
          activeBoxShadow: [
            BoxShadow(
                color: AppColors.kPrimaryColor,
                blurRadius: 2.0,
                spreadRadius: 0.4)
          ],
          inActiveBoxShadow: [
            BoxShadow(
                color: AppColors.kPrimaryColor,
                blurRadius: 2.0,
                spreadRadius: 0.4)
          ],
          // fieldHeight: 55.h,
          // fieldWidth: 55.w,
          fieldHeight: 35.h,
          fieldWidth: 35.w,
          activeFillColor:
              AppColors.greyColor, //! ============> Ineer Color Active
          activeColor:
              AppColors.kPrimaryColor, //! ============> Outer Color Active
          activeBorderWidth: 0.8,
          inactiveFillColor: AppColors.whiteColor,
          inactiveColor: AppColors.greyColor,
          selectedColor: AppColors.whiteColor,
          selectedFillColor: AppColors.whiteColor),
      animationDuration: const Duration(milliseconds: 300),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: controller,
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: (text) {
        return RegExp(r'^[0-9]+$').hasMatch(text ?? '');
      },
    );
  }
}
