import 'package:logger/logger.dart';

import 'log.dart';

class ConsolePrettyLog implements Log {
  final logger = Logger(
    filter: ProductionFilter(),
    printer: PrefixPrinter(
      SimplePrinter(
        printTime: false,
        colors: false,
      ),
      trace: "NETWORK",
    ),
  );

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    logger.t(message, error: error, stackTrace: stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void wtf(message, [error, StackTrace? stackTrace]) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
