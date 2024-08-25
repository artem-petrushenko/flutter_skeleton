import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_scope.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Theme'),
        DropdownButton<ThemeMode>(
          value: SettingsScope.themeOf(context).theme.mode,
          onChanged: (value) {
            SettingsScope.themeOf(context).setThemeMode(value ?? ThemeMode.system);
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark'),
            ),
          ],
        )
      ],
    );
  }
}
