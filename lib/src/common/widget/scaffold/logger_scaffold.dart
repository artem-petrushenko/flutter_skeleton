import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

class LoggerScaffold extends StatelessWidget {
  const LoggerScaffold({
    super.key,
    this.body,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
  });

  final Widget? body;
  final AppBar? appBar;
  final Color? backgroundColor;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          body ?? const SizedBox(),
          Positioned(
            bottom: 16.0,
            left: 16.0,
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
