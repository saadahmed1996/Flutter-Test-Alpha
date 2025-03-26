import "package:al_busayra_project/utils/app_colors.dart";
import "package:al_busayra_project/utils/app_fonts.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

// typedef FieldValidator = String? Function(String?)?;

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.validator,
    this.maxLength,
    this.textInputFormattors,
    this.prefixIcon,
    this.prefixIconColor,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.fillColor = AppColors.whiteColor,
    this.isMultiLine = false,
    this.isObsCure = false,
    this.onIconTap,
    this.readyOnly = false,
    this.textStyle,
    this.fontSize,
    this.hasShadow = true,
    this.textColor,
    this.helpertext,
    this.onTap,
    this.hintTextColor,
    this.onChanged,
    this.isLogin = false,
    this.textEditingController,
    this.height,
    this.filled = false,
    this.filledColor,
    this.borderColor,
    this.focusedColor,
    this.enabledBorderColor,
    this.focusNode,
    this.errorMaxLines,
    this.borderRadius,
  }) : super(key: key);
  final String hintText;
  final String? labelText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  // final FieldValidator? validator;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  final String? prefixIcon;
  final Color? prefixIconColor;

  final String? suffixIcon;
  final bool isMultiLine;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? textColor;
  final List<TextInputFormatter>? textInputFormattors;
  final TextStyle? textStyle;
  final String? helpertext;
  final TextEditingController? textEditingController;
  final bool readyOnly;
  final bool hasShadow;
  final bool isObsCure;
  final bool isLogin;
  final VoidCallback? onTap;
  final Function()? onIconTap;
  final double? fontSize;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final double? height;
  Color? filledColor;
  bool? filled;
  Color? borderColor;
  Color? focusedColor;
  Color? enabledBorderColor;
  FocusNode? focusNode;
  BorderRadius? borderRadius;
  int? errorMaxLines;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      // showCursor: true,
      // cursorOpacityAnimates: true,
      focusNode: widget.focusNode,
      obscureText: widget.isObsCure,
      onTap: widget.onTap,
      readOnly: widget.readyOnly,
      inputFormatters: widget.textInputFormattors,
      // validator: validator,
      validator: (value) {
        // Perform your custom validation here
        String? validationResult = widget.validator?.call(value);
        setState(() {
          hasError = validationResult != null;
        });
        return validationResult;
      },

      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: widget.textColor ?? Colors.black,
        fontSize: widget.fontSize ?? 14,
        fontWeight: FontWeight.w200,
      ),
      maxLines: widget.isMultiLine ? widget.maxLines : 1,
      // minLines: widget.isMultiLine ? (widget.minLines ?? 1) : 1,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: AppColors.redColor,
          height: 1,
          // fontSize: errorFontSize ?? 14,
          fontSize: 10.sp,
          fontFamily: AppFonts.openSansRegular,
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: widget.errorMaxLines ?? 1,
        contentPadding: EdgeInsets.all(16.r),
        filled: widget.filled,
        fillColor: widget.filledColor ?? AppColors.whiteColor,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 10,
          minHeight: 10,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: AppFonts.openSansRegular,
          color: widget.hintTextColor ?? Colors.grey,
          fontSize: widget.fontSize ?? 12.sp,
        ),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 10, bottom: 12),
                child: Image.asset(
                  widget.prefixIcon!,
                  height: 18.h,
                  color: widget.prefixIconColor ?? AppColors.whiteColor,
                ),
              )
            : null,
        suffixIcon: widget.suffixIcon != null || widget.isLogin
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 15),
                child: widget.isLogin
                    ? GestureDetector(
                        onTap: widget.onIconTap,
                        child: Icon(
                          widget.isObsCure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : Image.asset(
                        widget.suffixIcon!,
                        height: 22.h,
                        color: widget.prefixIconColor ?? AppColors.whiteColor,
                      ),
                // child: GestureDetector(
                //   onTap: widget.onIconTap,
                //   child: Image.asset(
                //     widget.suffixIcon!,
                //     height: 22.h,
                //     color: widget.prefixIconColor ?? AppColors.whiteColor,
                //   ),
                // ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.filledColor ?? AppColors.kPrimaryColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.focusedColor ?? AppColors.kPrimaryColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.enabledBorderColor ?? AppColors.kPrimaryColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
