import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/scaffold_with_nav_bar.dart';
import 'package:flutter_skeleton/src/core/utils/logger/logger.dart';
import 'package:flutter_skeleton/src/feature/home/widget/home_screen.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'routes.g.dart';

class Routes {
  static const settings = '/settings';
  static const logger = '/logger';
  static const home = '/home';
}

class BranchHomeData extends StatefulShellBranchData {
  const BranchHomeData();
}

@TypedStatefulShellRoute<BottomNavigationShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchHomeData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: Routes.home),
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

@TypedGoRoute<LoggerRoute>(path: Routes.logger)
class LoggerRoute extends GoRouteData {
  const LoggerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => TalkerScreen(talker: Logger.instance);
}

@TypedGoRoute<HomeRoute>(path: Routes.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<SettingsRoute>(path: Routes.settings)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingsScreen();
}