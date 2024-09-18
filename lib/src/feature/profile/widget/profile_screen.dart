import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/logger_scaffold.dart';
import 'package:flutter_skeleton/src/core/routing/routes.dart';
import 'package:flutter_skeleton/src/feature/auth/logic/showcase_helper.dart';
import 'package:flutter_skeleton/src/feature/auth/widget/auth_scope.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoggerScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: AuthScope.of(context).signOut,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  context.push(Routes.settings);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                type: MaterialType.transparency,
                child: StreamBuilder<void>(
                  stream: ShowcaseHelper().stream,
                  builder: (context, snapshot) => Column(
                    children: [
                      Row(
                        children: [
                          const Text('Expire access'),
                          Switch(
                            value: ShowcaseHelper().expireAccess,
                            onChanged: (value) => ShowcaseHelper().expireAccess = value,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Expire refresh'),
                          Switch(
                            value: ShowcaseHelper().expireRefresh,
                            onChanged: (value) => ShowcaseHelper().expireRefresh = value,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
