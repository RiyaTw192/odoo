import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddo_fe/config/theme/app_theme/theme_bloc.dart';
import 'package:oddo_fe/config/theme/app_theme/theme_state.dart';
import 'config/routes/app.router.dart';
import 'features/home/bloc/bottom_navigation/bottom_nav_cubit.dart';

class OddoMain extends StatelessWidget {
  const OddoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => BottomNavCubit(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
          return MaterialApp.router(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes().generateRoute(),
          );
        }));
  }
}
