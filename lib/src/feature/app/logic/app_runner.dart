import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/core/constant/config.dart';
import 'package:flutter_skeleton/src/core/utils/app_bloc_observer.dart';
import 'package:flutter_skeleton/src/core/utils/logger/logger.dart';
import 'package:flutter_skeleton/src/core/utils/refined_logger.dart';
import 'package:flutter_skeleton/src/feature/app/widget/app.dart';
import 'package:flutter_skeleton/src/feature/initialization/logic/composition_root.dart';
import 'package:flutter_skeleton/src/feature/initialization/widget/initialization_failed_app.dart';

final class AppRunner {
  const AppRunner();

  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    // Override logging
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;

    // Setup bloc observer and transformer
    Bloc.observer = const AppBlocObserver();
    Bloc.transformer = sequential();
    const config = Config();
    final initializationProcessor = CompositionRoot(config, logger);

    Future<void> initializeAndRun() async {
      try {
        final result = await initializationProcessor.compose();
        // Attach this widget to the root of the tree.
        runApp(App(result: result));
      } catch (e, stackTrace) {
        Logger.error('Initialization failed', exception: e, stackTrace: stackTrace);
        runApp(
          InitializationFailedApp(
            error: e,
            stackTrace: stackTrace,
            retryInitialization: initializeAndRun,
          ),
        );
      } finally {
        // Allow rendering
        binding.allowFirstFrame();
      }
    }

    // Run the app
    await initializeAndRun();
  }
}
