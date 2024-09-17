import 'dart:io';

import 'package:flutter/foundation.dart';

/// Enum to represent different environments.
enum Flavor {
  dev('DEV'),
  prod('PROD');

  /// The string value representing the environment.
  final String value;

  const Flavor(this.value);

  /// Returns the [Flavor] based on the given [value].
  static Flavor from(String? value) {
    switch (value) {
      case 'DEV':
        return Flavor.dev;
      case 'PROD':
        return Flavor.prod;
      default:
        return kReleaseMode ? Flavor.prod : Flavor.dev;
    }
  }
}

/// Class for application configuration.
class AppConfig {
  static AppConfig? _instance;

  /// Singleton accessor for the current instance of [AppConfig].
  static AppConfig get config {
    if (_instance == null) {
      throw StateError('AppConfig has not been initialized.');
    }
    return _instance!;
  }

  final Flavor environment;
  final String hostUrl;

  /// Initializes [AppConfig] based on the environment.
  AppConfig._internal({
    required this.environment,
    required this.hostUrl,
  });

  /// Factory constructor to initialize [AppConfig] based on the environment.
  factory AppConfig(String packageName) {
    final environment = const EnvironmentConfig().getEnvironment(packageName);
    _instance = AppConfig._initialize(environment);
    return _instance!;
  }

  /// Initializes the configuration based on the environment.
  static AppConfig _initialize(Flavor environment) {
    switch (environment) {
      case Flavor.prod:
        return AppConfig._internal(
          environment: Flavor.prod,
          hostUrl: 'https://flutter-starter.com',
        );
      case Flavor.dev:
      default:
        return AppConfig._internal(
          environment: Flavor.dev,
          hostUrl: 'https://flutter-starter-dev.com',
        );
    }
  }
}

/// Helper class to determine the environment based on build-time parameters.
class EnvironmentConfig {
  const EnvironmentConfig();

  /// Determines the environment based on the package name and platform.
  Flavor getEnvironment(String? packageName) {
    if ((Platform.isAndroid && packageName == 'com.starter') || (Platform.isIOS && packageName == 'com.starter')) {
      return Flavor.prod;
    }
    return Flavor.dev;
  }
}
