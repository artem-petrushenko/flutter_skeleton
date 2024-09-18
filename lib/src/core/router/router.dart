import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:flutter_skeleton/src/core/utils/logger/router_logger.dart';
import 'package:flutter_skeleton/src/core/router/auth_guard.dart';
import 'package:flutter_skeleton/src/core/router/redirect_builder.dart';
import 'package:flutter_skeleton/src/core/router/routes.dart';
import 'package:flutter_skeleton/src/core/utils/logger/logger.dart';
import 'package:go_router/go_router.dart';

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
      RouterLogger(),
    ],
    redirect: RedirectBuilder({
      RedirectIfAuthenticatedGuard(),
      RedirectIfUnauthenticatedGuard(),
    }).call,
  );
}
