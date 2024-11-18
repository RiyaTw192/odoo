import 'package:flutter/material.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';
import 'package:oddo_fe/core/constants/app_strings.dart';
import 'package:oddo_fe/core/constants/custom_widgets/custom_appbar.dart';
import '../../../../../core/constants/app_drawable.dart';
import '../../../../../core/constants/custom_widgets/custom_image_container.dart';
import '../../../../../core/constants/custom_widgets/custom_tabBar_widget.dart';
import '../../../../../core/constants/custom_widgets/odoo_card.dart';
import 'oddo_screen.dart';

class TimesheetScreen extends StatefulWidget {
  const TimesheetScreen({super.key});

  @override
  State<TimesheetScreen> createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradient1,
                AppColors.gradient2,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimen.SIZE_12, vertical: AppDimen.SIZE_20),
              child: Column(
                children: [
                  CustomAppBar(
                    title: AppStrings.timeSheets,
                    icons: const [Icons.add],
                  ),
                  const SizedBox(
                    height: AppDimen.SIZE_20,
                  ),
                  customTabBar(
                      context,
                      favouriteTab: Padding(
                        padding: const EdgeInsets.only(top: AppDimen.SIZE_100),
                        child: CustomImageContainer(
                          image: AppDrawable.favouriteImage,
                          text: AppStrings.favText,
                          subText:AppStrings.favSubText ,
                        ),
                      ),
                      oddoTab:OdooScreen(),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: AppDimen.SIZE_100),
                      //   child: CustomImageContainer(
                      //     image: AppDrawable.odooImage,
                      //     text: AppStrings.odooText,
                      //     subText:AppStrings.odooSubText ,
                      //   ),
                      // ),
                      localTab: Padding(
                        padding: const EdgeInsets.only(top: AppDimen.SIZE_100),
                        child: CustomImageContainer(
                          image: AppDrawable.timerImage,
                          text: AppStrings.localText,
                          subText:AppStrings.localSubText ,
                        ),
                      ),
                  ) ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.gradient2,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              size: AppDimen.SIZE_30,
            ),
            label: AppStrings.timeSheets,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, size: AppDimen.SIZE_30),
            label: AppStrings.projects,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: AppDimen.SIZE_30,
            ),
            label: AppStrings.settings,
          ),
        ],
      ),
    );
  }
}
