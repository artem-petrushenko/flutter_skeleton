import 'package:flutter_skeleton/src/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_skeleton/src/feature/dashboard/data/pokemon_repository.dart';
import 'package:flutter_skeleton/src/feature/initialization/logic/composition_root.dart';
import 'package:flutter_skeleton/src/feature/settings/bloc/settings_bloc.dart';
import 'package:intercepted_client/intercepted_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Composed dependencies from the [CompositionRoot].
///
/// This class is used to pass dependencies to the application.
///
/// {@macro composition_process}
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  const Dependencies({
    required this.settingsBloc,
    required this.authBloc,
    required this.pokemonRepository,
    required this.sharedPreferences,
    required this.interceptedClient,
  });

  /// [SettingsBloc] instance, used to manage theme and locale.
  final SettingsBloc settingsBloc;

  /// [AuthBloc] instance, used to manage authentication.
  final AuthBloc authBloc;

  /// [PokemonRepository] instance, used to manage pokemon data.
  final PokemonRepository pokemonRepository;

  /// [SharedPreferences] instance, used to store key-value data.
  final SharedPreferences sharedPreferences;

  /// [InterceptedClient] instance, used to intercept requests.
  final InterceptedClient interceptedClient;
}

/// {@template composition_result}
/// Result of composition
///
/// {@macro composition_process}
/// {@endtemplate}
final class CompositionResult {
  /// {@macro composition_result}
  const CompositionResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$CompositionResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
