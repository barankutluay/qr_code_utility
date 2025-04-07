import 'package:logger/logger.dart';

final class LoggerUtil {
  const LoggerUtil._();

  static final Logger _defaultLogger = Logger(printer: PrettyPrinter());

  static final Logger _infoLogger = Logger(
    printer: PrettyPrinter(methodCount: 0, errorMethodCount: 0),
  );

  static void debug(dynamic message) => _defaultLogger.d(message);

  static void info(dynamic message) => _infoLogger.i(message);

  static void warning(dynamic message) => _defaultLogger.w(message);

  static void error(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _defaultLogger.e(message, error: error, stackTrace: stackTrace);

  static void fatal(dynamic message) => _defaultLogger.f(message);
}
