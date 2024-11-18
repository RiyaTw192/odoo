import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/app_theme/theme.dart';
import '../app_colors.dart';
import '../app_dimen.dart';

class CustomButton extends StatelessWidget {
  String? buttonName;
  void Function()? onTap;
  CustomButton({
    super.key,
    this.buttonName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppDimen.SIZE_55,
        decoration: BoxDecoration(
          color: AppColors.gradient1.withOpacity(AppDimen.SIZE_03),
          borderRadius: const BorderRadius.all(Radius.circular(AppDimen.SIZE_12)),
        ),
        child: Center(
            child: Text(
              buttonName ?? "",
              style: AppThemes.nameTextStyle16,
            )),
      ),
    );
  }
}
