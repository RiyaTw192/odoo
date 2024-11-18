import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login_screen.dart';
import '../../features/splash_screen/presentation/view/splash_screen.dart';
import '../../features/timesheet/presentation/view/timesheet_screen.dart';

class AppRoutes {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
         return SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'timesheet',
            builder: (BuildContext context, GoRouterState state) {
              return const TimesheetScreen();
            },
          ),
        ],
      ),
    ]);
  }
}
