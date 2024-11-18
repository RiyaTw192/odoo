import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';
import 'package:oddo_fe/core/constants/app_strings.dart';
import '../../../../core/constants/app_drawable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradient1, AppColors.gradient2],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimen.SIZE_192,
              height: AppDimen.SIZE_192,
              decoration: BoxDecoration(
                color: AppColors.imageBgColor,
                borderRadius: AppDimen.BORDER_20,
              ),
              child: Image.asset(
                AppDrawable.hourGlassPng,
                width: AppDimen.SIZE_100,
                height: AppDimen.SIZE_100,
              ),
            ),
            const SizedBox(height: AppDimen.SIZE_20),
            Text(
              AppStrings.odoo,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppTextSize.HEADING_LARGE_32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppDimen.SIZE_10),
            Text(
              AppStrings.odooText,
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppTextSize.BODY_LARGE_16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ));
  }
}
