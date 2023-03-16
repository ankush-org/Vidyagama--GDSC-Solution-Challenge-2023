import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Pages/Home/P3A_home.dart';
import '../../Pages/Profile/P5_profile.dart';
import '../../Pages/Settings/P6A_settings.dart';
import '../../Pages/Test/P4A_testing.dart';
import 'app_route_constants.dart';

class AppNavRouter {
  GoRouter grouter = GoRouter(routes: [
    //Route 1
    GoRoute(
      name: AppNavRouteConstants.homeRouteName,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Home());
      },
    ),
    //Route 2
    GoRoute(
      name: AppNavRouteConstants.testingRouteName,
      path: '/testing',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Testing());
      },
    ),
    //Route 3
    GoRoute(
      name: AppNavRouteConstants.profileRouteName,
      path: '/profile',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Profile());
      },
    ),
    //Route 4
    GoRoute(
      name: AppNavRouteConstants.settingsRouteName,
      path: '/settings',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Settings());
      },
    ),
  ]);
}
