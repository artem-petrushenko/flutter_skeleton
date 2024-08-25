import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_scope.dart';

class LocaleWidget extends StatelessWidget {
  const LocaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Locale'),
        DropdownButton<Locale>(
          value: SettingsScope.localeOf(context).locale,
          onChanged: (value) {
            SettingsScope.localeOf(context).setLocale(value ?? const Locale('en'));
          },
          items: const [
            DropdownMenuItem(
              value: Locale('en'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('es'),
              child: Text('Spanish'),
            ),
          ],
        )
      ],
    );
  }
}
