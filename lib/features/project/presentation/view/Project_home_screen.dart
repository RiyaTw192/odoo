import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/theme/app_theme/theme_bloc.dart';
import '../../../../config/theme/app_theme/theme_state.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../home/bloc/bottom_navigation/bottom_nav_cubit.dart';
import '../../../home/view/home_component.dart';



class ProjectHomeScreen extends StatefulWidget {
  const ProjectHomeScreen({super.key});

  @override
  State<ProjectHomeScreen> createState() => _ProjectHomeScreenState();
}

class _ProjectHomeScreenState extends State<ProjectHomeScreen> {
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
                body: HomeComponent(index: cubit.state.selectedIndex,title: AppStrings.projects,onTap: (){
                  context.go('/createProjects');
                }, ),
              );
            },
          );
        },
      ),

    );
  }
}
