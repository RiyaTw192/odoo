import 'package:flutter/material.dart';
import 'package:oddo_fe/config/theme/app_theme/theme.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  List<IconData>? icons;
  IconData? leadingIcon;
  bool? isBoxIcon ;
  IconData? icon;

  CustomAppBar({super.key, this.title, this.icons, this.leadingIcon,this.isBoxIcon,this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (leadingIcon != null)
          IconButton(
            onPressed: () {},
            icon: Icon(
              leadingIcon,
              size: AppDimen.SIZE_30,
              color: AppColors.primaryColor,
            ),
          )
        else
          const SizedBox(width: AppDimen.SIZE_50),

        if ((icons?.isEmpty ?? true))
          Expanded(
            child: Text(
              title ?? "",
              style: AppThemes.nameTextStyle,
              textAlign: TextAlign.center,
            ),
          )
        else
          Text(
            title ?? "",
            style: AppThemes.nameTextStyle,
            textAlign: TextAlign.center,
          ),

        if ((icons?.isEmpty ?? true) && !(isBoxIcon??false))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimen.PADDING_10),
            child: Icon(
              icon, // Show the passed icon here
              size: AppDimen.SIZE_30,
              color: AppColors.primaryColor,
            ),
          )
        else if ((icons?.isNotEmpty ?? false) && (isBoxIcon??false))
          Row(
            children: icons!
                .map(
                  (iconItem) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimen.PADDING_10),
                child: Container(
                  padding: const EdgeInsets.all(AppDimen.PADDING_10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    iconItem,
                    size: AppDimen.SIZE_30,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            )
                .toList(),
          )
        else
          const SizedBox(width: AppDimen.SIZE_50),
      ],
    );


  }
}