// ignore_for_file: must_be_immutable
import 'package:al_busayra_project/custom_widgets/custom_app_bar.dart';
import 'package:al_busayra_project/utils/app_assets_path.dart';
import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonScaffold extends StatelessWidget {
  final String? title;
  final double? leadingWidth;
  final double? leadingPadding;
  final Color? titleColor;
  final Color? leadingColor;
  final String? leading;
  final String? action;
  final Widget? actionWidget;
  final String? actionText;
  bool? isBottomNav;
  bool? extentBody;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  void Function()? onclickLead, onclickAction;
  final Widget child;
  Widget? drawer;
  Key? globalkey;
  bool? isRegistration;
  CommonScaffold(
      {Key? key,
      required this.child,
      this.leadingWidth,
      this.leadingPadding,
      this.actionWidget,
      this.titleColor,
      this.leadingColor,
      this.isRegistration = false,
      this.isBottomNav = false,
      this.title,
      this.leading,
      this.extentBody = false,
      this.action,
      this.onclickLead,
      this.onclickAction,
      this.actionText,
      this.drawer,
      this.globalkey,
      this.floatingActionButtonLocation,
      this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          image: isRegistration == true
              ? const DecorationImage(
                  image: AssetImage(AssetPaths.BACKGROUND_IMAGE),
                  fit: BoxFit.fill,
                )
              : null,
          // color: AppColors.SCAFFOLD_COLOR,
        ),
        child: isBottomNav == false ? scaffoldWidget(context) : child);
  }

  Widget scaffoldWidget(context) {
    return Scaffold(
        backgroundColor: AppColors.transparentColor,
        extendBodyBehindAppBar: extentBody!,
        resizeToAvoidBottomInset: true,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        appBar: CustomAppBar(
          context: context,
          title: title,
          leadingWidth: leadingWidth,
          leadingPadding: leadingPadding,
          titleColor: titleColor,
          isLeading: leading,
          isicon: false,
          onclickLead: onclickLead,
          isAction: action,
          onclickAction: onclickAction,
          isRegistration: isRegistration,
        ),
        body: child,
        drawer: drawer,
        key: globalkey);
  }
}
