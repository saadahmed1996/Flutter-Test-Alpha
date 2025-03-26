import 'package:flutter/material.dart';

class AppColors {
  static const Color redColor = Colors.red;
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color yellowColor = Colors.yellow;

  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;

  static const Color greenColor = Color(0xff03773A);
  static const Color lightGreenColor = Color(0xff4BF99D);

  static const Color blueColor = Color(0xff1BCCF5);
  static const SCAFFOLD_COLOR = Color(0xFFC5EDDC);
  static const BUTTON_COLOR = Color(0XFF48CE93);
  static const LIGHT_GREY_COLOR = Color(0XFFE2E2E2);

  //Shimmer Color
  static const shimmerBaseColor = Color.fromRGBO(64, 64, 64, 0.2);
  static const shimmerHighlightColor = Color.fromRGBO(166, 166, 166, 0.5);

  static MaterialColor kPrimaryColor =
      const MaterialColor(0xff1F4F74, <int, Color>{
    50: Color(0xff1F4F74),
    100: Color(0xff1F4F74),
    200: Color(0xff1F4F74),
    300: Color(0xff1F4F74),
    400: Color(0xff1F4F74),
    500: Color(0xff1F4F74),
    600: Color(0xff1F4F74),
    700: Color(0xff1F4F74),
    800: Color(0xff1F4F74),
    900: Color(0xff1F4F74),
  });
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
