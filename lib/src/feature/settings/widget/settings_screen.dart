import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_skeleton/src/common/widget/scaffold/logger_scaffold.dart';
import 'package:flutter_skeleton/src/core/constant/localization/localization.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/locale/locale_widget.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/text_scale/text_scale_widget.dart';
import 'package:flutter_skeleton/src/feature/settings/widget/text_scale/theme_selector_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoggerScaffold(
      appBar: AppBar(
        title: Text(Localization.of(context).settings),
      ),
      body: ListView(
        children: const [
          TextScaleWidget(),
          ThemeSelectorWidget(),
          LocaleWidget(),
        ],
      ),
    );
  }
}
