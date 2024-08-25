import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

class LoggerScaffold extends StatelessWidget {
  const LoggerScaffold({
    super.key,
    this.body,
    this.appBar,
    this.backgroundColor,
  });

  final Widget? body;
  final AppBar? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          body ?? const SizedBox(),
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: IconButton.filledTonal(
              onPressed: () => context.push(Routes.logger),
              icon: const Icon(Icons.bug_report_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
