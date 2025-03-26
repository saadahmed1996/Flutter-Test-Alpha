import 'package:al_busayra_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomKeyboardActionWidget extends StatelessWidget {
  final Widget child;
  final FocusNode focusNode;
  const CustomKeyboardActionWidget(
      {super.key, required this.child, required this.focusNode});
  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
        config: _buildConfig(context), disableScroll: true, child: child);
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: AppColors.greyColor,
      actions: [
        KeyboardActionsItem(focusNode: focusNode, displayArrows: false),
      ],
    );
  }
}
