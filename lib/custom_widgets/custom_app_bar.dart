import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget? CustomAppBar({
  required BuildContext context,
  final String? title,
  final Widget? child,
  final double? leadingWidth,
  final double? leadingPadding,
  final Color? titleColor,
  final String? isLeading,
  bool? isicon,
  void Function()? onclickLead,
  final String? isAction,
  final String? isAction1,
  final String? isAction2,
  void Function()? onclickAction,
  void Function()? onclickAction1,
  void Function()? onclickAction2,
  bool? isRegistration,
}) {
  return AppBar(
    scrolledUnderElevation: 0,
    leadingWidth: leadingWidth,
    toolbarHeight: 0.07.sh,
    backgroundColor: AppColors.transparentColor,
    elevation: 0.0,
    title: Text(
      title ?? "",
      style: TextStyle(
          color: titleColor ?? AppColors.blackColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: child != null ? false : true,
    leading: isLeading != null
        ? Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.only(left: leadingPadding ?? 0.04.sw),
              child: GestureDetector(
                onTap: onclickLead,
                child: Image.asset(
                  isLeading,
                  alignment: Alignment.centerLeft,
                  scale: 3,
                ),
              ),
            );
          })
        : child,
    actions: [
      // AppString.selectedOption == "user"
      //     ? isAction != null || isAction1 != null || isAction2 != null
      //         ? Padding(
      //             padding: const EdgeInsets.only(
      //               right: 20,
      //             ),
      //             child: Row(
      //               children: [
      //                 isAction != null
      //                     ? InkWell(
      //                         onTap: onclickAction,
      //                         child: Image.asset(
      //                           isAction,
      //                           scale: 3,
      //                           alignment: Alignment.center,
      //                         ),
      //                       )
      //                     : SizedBox(),
      //                 3.horizontalSpace,
      //                 if (isAction1 != null)
      //                   InkWell(
      //                     onTap: onclickAction1,
      //                     child: Image.asset(
      //                       isAction1,
      //                       scale: 3,
      //                       alignment: Alignment.center,
      //                     ),
      //                   ),
      //                 3.horizontalSpace,
      //                 if (isAction2 != null)
      //                   InkWell(
      //                     onTap: onclickAction2,
      //                     child: Image.asset(
      //                       isAction2,
      //                       scale: 3,
      //                       alignment: Alignment.center,
      //                     ),
      //                   ),
      //               ],
      //             ),
      //           )
      //         : const SizedBox()
      //     : isAction != null
      //         ? Padding(
      //             padding: const EdgeInsets.only(right: 15),
      //             child: InkWell(
      //               onTap: onclickAction,
      //               child: Image.asset(
      //                 isAction,
      //                 scale: 3,
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //           )
      //         : const SizedBox(),
    ],
  );
}

AppBar appBarWithLeading({
  required String titleText,
  Function()? onTapForBack,
  required bool showArrow,
  Function()? onTapForDrawer,
  Function()? onTapForNoti,
  required bool showNotificationIcon,
  required bool showDrawerIcon,
  Widget? suffix,
  double? titleFontSize,
  double? toolbarHeigth,
  Color? appbarColor,
}) {
  return AppBar(
    backgroundColor: appbarColor ?? AppColors.kPrimaryColor,
    elevation: 0,
    toolbarHeight: toolbarHeigth ?? 70.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(27.sp))),
    centerTitle: true,
    leadingWidth: (.05.sw + 42.w),
    leading: showDrawerIcon
        ? Padding(
            padding: EdgeInsets.only(left: .05.sw),
            child: GestureDetector(
              onTap: onTapForDrawer,
              child: Container(
                width: 42.w,
                height: 42.h,
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 13.w),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.whiteColor),
                child: Image.asset(
                  AssetPaths.BACK_ARROW_ICON,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          )
        : showArrow
            ? Padding(
                padding: EdgeInsets.only(left: .05.sw),
                child: GestureDetector(
                  onTap: onTapForBack,
                  child: Image.asset(
                    AssetPaths.BACK_ARROW_ICON,
                    alignment: Alignment.centerLeft,
                    scale: 3,
                  ),
                ),
              )
            : const SizedBox.shrink(),
    title: Text(
      titleText,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    titleSpacing: 0.0,
    actions: [
      showNotificationIcon
          ? Padding(
              padding: EdgeInsets.only(right: .05.sw),
              child: GestureDetector(
                onTap: onTapForNoti,
                child: Container(
                  width: 42.w,
                  height: 42.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 11.h, horizontal: 13.w),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.whiteColor),
                  // child: Image.asset(AppAssets.dashboard_icons[1],
                  //     fit: BoxFit.fitWidth, color: AppColors.BUTTON_COLOR),
                ),
              ),
            )
          : const SizedBox.shrink(),
      suffix ?? const SizedBox.shrink()
      //   showEditIcon
      //       ? InkWell(
      //           onTap: onTapForEdit,
      //           child: Image.asset(
      //             AssetPaths.APPBAR_EDIT_ICON,
      //             // height: 46.sp,
      //             scale: 3.2.sp,
      //           ),
      //         )
      //       : const SizedBox.shrink(),
      //   //Continue from here Seekh kabab Icon
      //   showSeekhKbabIcon
      //       ? Padding(
      //           padding: const EdgeInsets.only(right: 20.0),
      //           child: InkWell(
      //             onTap: onTapForBottomSheet,
      //             child: Image.asset(
      //               AssetPaths.APPBAR_SEEKH_KBABA_ICON,
      //               scale: 4.4,
      //             ),
      //           ),
      //         )
      //       : const SizedBox.shrink(),
    ],
  );
}
