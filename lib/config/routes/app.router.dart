import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login_screen.dart';
import '../../features/project/view/create_projects.dart';
import '../../features/timesheet/presentation/view/create_timer.dart';
import '../../features/timesheet/presentation/view/timesheets/timesheet_screen.dart';

class AppRoutes {
  GoRouter generateRoute() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
         return TimesheetScreen();
         // return SplashScreen();
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
          GoRoute(
            path: 'createTimer',
            builder: (BuildContext context, GoRouterState state) {
              return  CreateTimerScreen();
            },
          ),
          GoRoute(
            path: 'createProjects',
            builder: (BuildContext context, GoRouterState state) {
              return  CreateProjects();
            },
          ),
        ],
      ),
    ]);
  }
}
