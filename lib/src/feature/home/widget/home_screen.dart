import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/logger_scaffold.dart';
import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:flutter_skeleton/src/core/utils/layout/layout.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.sizeOf(context).width;
    final windowSize = WindowSize.fromWidth(windowWidth);

    return LoggerScaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push(Routes.settings);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: HorizontalSpacing.centered(windowWidth),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: switch (windowSize) {
                  WindowSize.compact => 2,
                  <= WindowSize.expanded => 3,
                  _ => 4,
                },
              ),
              itemBuilder: (context, index) => ColoredBox(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
