import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/theme/app_theme/theme_bloc.dart';
import '../../../config/theme/app_theme/theme_state.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimen.dart';
import '../../../core/constants/app_drawable.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/custom_widgets/custom_appbar.dart';
import '../../../core/constants/custom_widgets/custom_image_container.dart';
import '../../../core/constants/custom_widgets/custom_tabBar_widget.dart';

class HomeComponent extends StatefulWidget {
  int? index;
   HomeComponent({super.key,this.index});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        switch (widget.index) {
          case 0:
            return SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimen.SIZE_12, vertical: AppDimen.SIZE_20),
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
                              subText: AppStrings.favSubText,
                            ),
                          ),
                          oddoTab: Padding(
                            padding: const EdgeInsets.only(top: AppDimen.SIZE_100),
                            child: CustomImageContainer(
                              image: AppDrawable.odooImage,
                              text: AppStrings.odooText,
                              subText: AppStrings.odooSubText,
                            ),
                          ),
                          localTab: Padding(
                            padding: const EdgeInsets.only(top: AppDimen.SIZE_100),
                            child: CustomImageContainer(
                              image: AppDrawable.timerImage,
                              text: AppStrings.localText,
                              subText: AppStrings.localSubText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          case 1:
            return const Center(child: Text('Projects Screen'));
          case 2:
            return const Center(child: Text('Setting Screen'));
          default:
            return const Center(child: Text('Unknown Screen'));
        }
      },
    );
  }
}
