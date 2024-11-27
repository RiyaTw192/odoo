import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import '../../../core/constants/app_dimen.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.gradient1,),
    //primarySwatch: AppColors.primarySwatchColor,
    primaryColor: AppColors.gradient1,
    scaffoldBackgroundColor: AppColors.tranparentColor,
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.gradient2.withOpacity(0.4),
    ),
    dialogBackgroundColor: AppColors.gradient2,
    indicatorColor: AppColors.primaryColor,
    toggleButtonsTheme:
        const ToggleButtonsThemeData(color: AppColors.primaryColor),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    primaryIconTheme: const IconThemeData(color: AppColors.primaryColor),
    shadowColor: AppColors.gradient1,
    cardColor: AppColors.gradient2.withOpacity(0.4),
    dividerColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.primaryColor),
      bodyMedium: TextStyle(color: AppColors.primaryColor),
    ),
  );


  // dark
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.onPrimaryColor,
    ),
    brightness: Brightness.dark,
    primaryColor: AppColors.onPrimaryColor,
    scaffoldBackgroundColor: AppColors.onPrimaryColor,
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.greyColor,
    ),
    dialogBackgroundColor: AppColors.greyColor,
    indicatorColor: AppColors.primaryColor,
    toggleButtonsTheme:
        const ToggleButtonsThemeData(color: AppColors.onPrimaryColor),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    primaryIconTheme: const IconThemeData(color: AppColors.primaryColor),
    shadowColor: AppColors.greyColor,
    cardColor: AppColors.greyColor,
    dividerColor: AppColors.primaryColor,
  );

  static TextStyle normalNameTextStyle = const TextStyle(
    fontSize: AppDimen.SIZE_32,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle nameTextStyle = TextStyle(
    fontSize: AppDimen.SIZE_24,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
  );

  static  TextStyle nameTextStyle16 = TextStyle(
    fontSize: AppDimen.SIZE_16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );
}
