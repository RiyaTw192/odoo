import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';
import 'package:oddo_fe/core/constants/app_strings.dart';
import 'package:oddo_fe/features/home/view/home_component.dart';
import '../../../../../config/theme/app_theme/theme_bloc.dart';
import '../../../../../config/theme/app_theme/theme_state.dart';
import '../../../../home/bloc/bottom_navigation/bottom_nav_cubit.dart';


class TimesheetScreen extends StatelessWidget {
  const TimesheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child:  BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          bool isLightTheme = themeState.themeData.brightness == Brightness.light;

          return BlocBuilder<BottomNavCubit, BottomNavState>(
            builder: (context, state) {
              BottomNavCubit cubit = BottomNavCubit.get(context);
              return Scaffold(
                body: HomeComponent(index: cubit.state.selectedIndex, title: AppStrings.timeSheets,onTap:(){
                  context.go('/createTimer');
                } , ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: isLightTheme
                      ? AppColors.gradient2
                      : Colors.black,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white54,
                  currentIndex: cubit.state.selectedIndex,
                  onTap: (index) => cubit.changeTab(index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.timer, size: AppDimen.SIZE_30),
                      label: AppStrings.timeSheets,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.work, size: AppDimen.SIZE_30),
                      label: AppStrings.projects,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings, size: AppDimen.SIZE_30),
                      label: AppStrings.settings,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

    );
  }
}

