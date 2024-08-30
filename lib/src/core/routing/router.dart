import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:flutter_skeleton/src/core/utils/logger/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  factory AppRouter() {
    return _instance;
  }

  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: $appRoutes,
    observers: [
      TalkerRouteObserver(Logger.instance),
    ],
    // redirect: [],
  );
}
