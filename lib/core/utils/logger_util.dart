import 'package:logger/logger.dart';

final class LoggerUtil {
  const LoggerUtil._();

  static final Logger _defaultLogger = Logger(printer: PrettyPrinter());

  static final Logger _infoLogger = Logger(
    printer: PrettyPrinter(methodCount: 0, errorMethodCount: 0),
  );

  static void debug(String message) => _defaultLogger.d(message);

  static void info(String message) => _infoLogger.i(message);

  static void warning(String message) => _defaultLogger.w(message);

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _defaultLogger.e(message, error: error, stackTrace: stackTrace);
  }

  static void fatal(String message) => _defaultLogger.f(message);
}
