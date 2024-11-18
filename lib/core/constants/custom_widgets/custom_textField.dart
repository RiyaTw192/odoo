import 'package:flutter/material.dart';
import 'package:oddo_fe/config/theme/app_theme/theme.dart';
import '../app_colors.dart';
import '../app_dimen.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  void Function(String)? onChanged;
  void Function()? onTap;
  String? hintText;
  String? errorText;
  Widget? suffixIcon;
  bool? obscureText;
  CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText ?? "",
        hintStyle: AppThemes.nameTextStyle16,
       // errorText: errorText ?? "",
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(AppDimen.SIZE_02),
            ),
            borderRadius: BorderRadius.circular(AppDimen.SIZE_12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(AppDimen.SIZE_02),
              width: AppDimen.SIZE_2), // Custom focus color
          borderRadius: BorderRadius.circular(AppDimen.SIZE_12),
        ),
      ),
    );
  }
}
