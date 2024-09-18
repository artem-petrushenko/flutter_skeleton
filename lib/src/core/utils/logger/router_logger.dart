import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/utils/logger/refined_logger.dart';

class RouterLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.transition('Route pushed: ${route.settings.name}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.transition('Route popped: ${route.settings.name}');
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.transition('Route removed: ${route.settings.name}');
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logger.transition('Route replaced: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.transition('User gesture started: ${route.settings.name}');
  }

  @override
  void didStopUserGesture() {
    logger.transition('User gesture stopped');
  }
}
