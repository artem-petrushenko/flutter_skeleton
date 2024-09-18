import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/scaffold_with_navigation_bar.dart';
import 'package:flutter_skeleton/src/core/utils/logger/logger.dart';
import 'package:flutter_skeleton/src/feature/auth/widget/login_screen.dart';
import 'package:flutter_skeleton/src/feature/dashboard/widget/dashboard_screen.dart';
import 'package:flutter_skeleton/src/feature/home/widget/home_screen.dart';
import 'package:flutter_skeleton/src/feature/profile/widget/profile_screen.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'routes.g.dart';

abstract class Routes {
  static const settings = '/settings';
  static const logger = '/logger';
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
}

/// BranchHomeData is a branch data for the home screen.
class BranchHomeData extends StatefulShellBranchData {
  const BranchHomeData();
}

/// BranchDashboardData is a branch data for the dashboard screen.
class BranchDashboardData extends StatefulShellBranchData {
  const BranchDashboardData();
}

/// BranchProfileData is a branch data for the profile screen.
class BranchProfileData extends StatefulShellBranchData {
  const BranchProfileData();
}

/// BottomNavigationShellRoute is a shell route for the bottom navigation bar.
@TypedStatefulShellRoute<BottomNavigationShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchHomeData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: Routes.home),
      ],
    ),
    TypedStatefulShellBranch<BranchDashboardData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<DashboardRoute>(path: Routes.dashboard),
      ],
    ),
    TypedStatefulShellBranch<BranchProfileData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: Routes.profile),
      ],
    ),
  ],
)
class BottomNavigationShellRoute extends StatefulShellRouteData {
  const BottomNavigationShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      ScaffoldWithNavigationBar(navigationShell: navigationShell);
}

/// LoggerRoute is a route for the logger screen.
@TypedGoRoute<LoggerRoute>(path: Routes.logger)
class LoggerRoute extends GoRouteData {
  const LoggerRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      TalkerScreen(talker: Logger.instance);
}

/// HomeRoute is a route for the home screen.
@TypedGoRoute<HomeRoute>(path: Routes.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
}

/// SettingsRoute is a route for the settings screen.
@TypedGoRoute<SettingsRoute>(path: Routes.settings)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SettingsScreen();
}

/// LoginRoute is a route for the login screen.
@TypedGoRoute<LoginRoute>(path: Routes.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginScreen();
}

/// DashboardRoute is a route for the dashboard screen.
@TypedGoRoute<DashboardRoute>(path: Routes.dashboard)
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DashboardScreen();
}

/// ProfileRoute is a route for the profile screen.
@TypedGoRoute<ProfileRoute>(path: Routes.profile)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ProfileScreen();
}
