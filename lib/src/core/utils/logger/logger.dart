import 'package:talker/talker.dart';

class Logger {
  static final Talker _instance = Talker(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: 100,
      useConsoleLogs: true,
    ),
  );

  Logger._internal();

  factory Logger() {
    return Logger._internal();
  }

  static Talker get instance => _instance;

  static void log(
    dynamic message, {
    LogLevel logLevel = LogLevel.debug,
    Object? exception,
    StackTrace? stackTrace,
    AnsiPen? pen,
  }) =>
      _instance.log(
        message,
        logLevel: logLevel,
        exception: exception,
        stackTrace: stackTrace,
        pen: pen,
      );

  static void handle(
    Object exception, [
    StackTrace? stackTrace,
    dynamic msg,
  ]) =>
      _instance.handle(exception, stackTrace, msg);

  static void error(
    dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
  }) =>
      _instance.error(msg, exception, stackTrace);

  static void info(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) =>
      _instance.info(msg, exception, stackTrace);

  static bool logPlatformDispatcherError(Object error, StackTrace stackTrace) {
    _instance.error(
      'Platform Dispatcher Error: $error',
      error,
      stackTrace,
    );
    return true;
  }
}
