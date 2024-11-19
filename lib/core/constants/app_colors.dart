import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color onPrimaryColor = Color(0xFF000000);
  static Color greyColor = Color(0xFF000000).withOpacity(0.5);
  static const Color onErrorColor = Color(0xFFCC3C21);
  static const Color tranparentColor = Colors.transparent;

  static const Color gradient1 = Color(0xFF0e235f);
  static const Color gradient2 = Color(0xFF1f49c0);
  static Color bgColor = const Color(0xFFFCFCFC);
  static Color imageBgColor = const Color(0xFF28428e);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color cardColor = const Color(0xFF28418b);
  static Color yellowColor = const Color(0xFFFFC629);
  static Color boxBgColor = const Color(0xFF2a499e);
  static Color darkBoxBgColor = const Color(0xFF2c2c2c);
  static Color syncBoxBgColor = const Color(0xFF3a559f);
  static Color darkSyncBoxBgColor = const Color(0xFF4d4d4d);
  static Color settingBoxColor = const Color(0xFF2e51b3);
  static Color darkBlue = const Color(0xFF233976);
  static const LinearGradient primaryGradientLight = LinearGradient(
    colors: [
      Color(0xFF0C1D4D),
      Color(0xFF214ECC),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient primaryGradientDark = LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF000000).withOpacity(0.5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static MaterialColor primarySwatchColor =
      const MaterialColor(0xFFF2988C, <int, Color>{
    50: Color.fromRGBO(242, 152, 140, .1),
    100: Color.fromRGBO(242, 152, 140, .2),
    200: Color.fromRGBO(242, 152, 140, .3),
    300: Color.fromRGBO(242, 152, 140, .4),
    400: Color.fromRGBO(242, 152, 140, .5),
    500: Color.fromRGBO(242, 152, 140, .6),
    600: Color.fromRGBO(242, 152, 140, .7),
    700: Color.fromRGBO(242, 152, 140, .8),
    800: Color.fromRGBO(242, 152, 140, .9),
    900: Color.fromRGBO(242, 152, 140, 1),
  });
}
