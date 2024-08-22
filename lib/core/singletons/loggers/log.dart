import 'package:template_app/core/singletons/environment/environments.dart';

class Log {
  /// Log a message at level verbose.
  void v(dynamic message, [Object? error, StackTrace? stackTrace]) {}

  /// Log a message at level debug.
  void d(dynamic message, [Object? error, StackTrace? stackTrace]) {}

  /// Log a message at level info.
  void i(dynamic message, [Object? error, StackTrace? stackTrace]) {}

  /// Log a message at level warning.
  void w(dynamic message, [Object? error, StackTrace? stackTrace]) {}

  /// Log a message at level error.
  void e(dynamic message, [Object? error, StackTrace? stackTrace]) {}

  /// Log a message at level wtf.
  void wtf(dynamic message, [Object? error, StackTrace? stackTrace]) {}
}

logD(dynamic message) {
  Environment.log.d(message);
  Environment.fileLog.d(message);
}

logV(dynamic message) {
  Environment.log.v(message);
  Environment.fileLog.v(message);
}

logW(dynamic message, {Object? e, StackTrace? stackTrace}) {
  Environment.log.w(message, e, stackTrace);
  Environment.fileLog.w(message, e, stackTrace);
}

logE(dynamic message, {Object? e, StackTrace? stackTrace}) {
  Environment.log.e(message, e, stackTrace);
  Environment.fileLog.e(message, e, stackTrace);
}

logI(dynamic message) {
  Environment.log.i(message);
  Environment.fileLog.i(message);
}

logWTF(dynamic message, {Object? e, StackTrace? stackTrace}) {
  Environment.log.wtf(message, e, stackTrace);
  Environment.fileLog.wtf(message, e, stackTrace);
}
