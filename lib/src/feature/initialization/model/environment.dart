import 'package:flutter/foundation.dart';

/// The environment enum.
enum Environment {
  /// Development environment.
  dev._('DEV'),

  /// Production environment.
  prod._('PROD');

  /// The environment value.
  final String value;

  const Environment._(this.value);

  /// Returns the environment from the given [value].
  static Environment from(String? value) => switch (value) {
        'DEV' => Environment.dev,
        'PROD' => Environment.prod,
        _ => kReleaseMode ? Environment.prod : Environment.dev,
      };
}

/// Application configuration class
class AppConfig {
  static final AppConfig _instance = AppConfig._();

  /// Returns the current instance of the app configuration.
  static AppConfig get config => _instance;

  final Environment environment;
  final String hostUrl;
  final String jsonFile;

  /// Factory constructor to initialize [AppConfig] with the correct environment.
  factory AppConfig() {
    final environment = const EnvironmentConfig().environment;
    if (environment == Environment.dev) {
      return _instance._initDev();
    } else {
      return _instance._initProd();
    }
  }

  AppConfig._({
    this.environment = Environment.prod,
    this.hostUrl = '',
    this.jsonFile = '',
  });

  /// Initializes the development environment configuration.
  AppConfig _initDev() {
    return AppConfig._(
      environment: Environment.dev,
      hostUrl: 'https://flutter-starter-dev.com',
      jsonFile: 'assets/config/json-dev.json',
    );
  }

  /// Initializes the production environment configuration.
  AppConfig _initProd() {
    return AppConfig._(
      environment: Environment.prod,
      hostUrl: 'https://flutter-starter.com',
      jsonFile: 'assets/config/json-prod.json',
    );
  }
}

/// Helper class to retrieve the environment from compile-time constants.
class EnvironmentConfig {
  const EnvironmentConfig();

  /// Retrieves the current environment from build-time parameters.
  Environment get environment {
    var environment = const String.fromEnvironment('ENVIRONMENT');
    return Environment.from(environment);
  }
}
