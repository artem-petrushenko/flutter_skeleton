import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/app/widget/material_context.dart';
import 'package:flutter_skeleton/src/feature/initialization/logic/composition_root.dart';
import 'package:flutter_skeleton/src/feature/initialization/model/dependencies.dart';
import 'package:flutter_skeleton/src/feature/initialization/widget/dependencies_scope.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_scope.dart';

class App extends StatelessWidget {
  const App({required this.result, super.key});

  /// The result from the [CompositionRoot].
  final CompositionResult result;

  @override
  Widget build(BuildContext context) => DependenciesScope(
        dependencies: result.dependencies,
        child: SettingsScope(
          settingsBloc: result.dependencies.settingsBloc,
          child: const MaterialContext(),
        ),
      );
}
