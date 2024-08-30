import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/settings_scope.dart';

class TextScaleWidget extends StatelessWidget {
  const TextScaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Text scale'),
        Slider(
          divisions: 8,
          min: 0.5,
          max: 2,
          value: SettingsScope.textScaleOf(context).textScale,
          onChanged: (value) {
            SettingsScope.textScaleOf(context).setTextScale(value);
          },
        ),
      ],
    );
  }
}
