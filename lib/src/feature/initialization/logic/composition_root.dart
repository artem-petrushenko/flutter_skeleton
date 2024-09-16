import 'package:flutter_skeleton/src/feature/initialization/model/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_skeleton/src/core/utils/refined_logger.dart';
import 'package:flutter_skeleton/src/feature/initialization/model/dependencies.dart';
import 'package:flutter_skeleton/src/feature/settings/bloc/settings_bloc.dart';
import 'package:flutter_skeleton/src/feature/settings/data/locale_datasource.dart';
import 'package:flutter_skeleton/src/feature/settings/data/locale_repository.dart';
import 'package:flutter_skeleton/src/feature/settings/data/text_scale_datasource.dart';
import 'package:flutter_skeleton/src/feature/settings/data/text_scale_repository.dart';
import 'package:flutter_skeleton/src/feature/settings/data/theme_datasource.dart';
import 'package:flutter_skeleton/src/feature/settings/data/theme_mode_codec.dart';
import 'package:flutter_skeleton/src/feature/settings/data/theme_repository.dart';

/// {@template composition_root}
/// A place where all dependencies are initialized.
/// {@endtemplate}
///
/// {@template composition_process}
/// Composition of dependencies is a process of creating and configuring
/// instances of classes that are required for the application to work.
///
/// It is a good practice to keep all dependencies in one place to make it
/// easier to manage them and to ensure that they are initialized only once.
/// {@endtemplate}
final class CompositionRoot {
  /// {@macro composition_root}
  const CompositionRoot(this.logger);

  /// Logger used to log information during composition process.
  final RefinedLogger logger;

  /// Composes dependencies and returns result of composition.
  Future<CompositionResult> compose() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = CompositionResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }

  Future<Dependencies> _initDependencies() async {
    AppConfig();
    final sharedPreferences = SharedPreferencesAsync();
    final settingsBloc = await _initSettingsBloc(sharedPreferences);

    return Dependencies(
      settingsBloc: settingsBloc,
    );
  }

  Future<SettingsBloc> _initSettingsBloc(SharedPreferencesAsync prefs) async {
    final localeRepository = LocaleRepositoryImpl(
      localeDataSource: LocaleDataSourceLocal(sharedPreferences: prefs),
    );

    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        codec: const ThemeModeCodec(),
      ),
    );

    final textScaleRepository = TextScaleRepositoryImpl(
      textScaleDataSource: TextScaleDatasourceLocal(sharedPreferences: prefs),
    );

    final localeFuture = localeRepository.getLocale();
    final theme = await themeRepository.getTheme();
    final locale = await localeFuture;
    final textScale = await textScaleRepository.getScale();

    final initialState = SettingsState.idle(
      appTheme: theme,
      locale: locale,
      textScale: textScale,
    );

    final settingsBloc = SettingsBloc(
      localeRepository: localeRepository,
      themeRepository: themeRepository,
      textScaleRepository: textScaleRepository,
      initialState: initialState,
    );
    return settingsBloc;
  }
}
