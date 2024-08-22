import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:template_app/core/app_global/auth_notifier.dart';
import 'package:template_app/core/singletons/loggers/log.dart';
import 'package:template_app/data/core/network/api_errors/exceptions.dart';
import 'package:template_app/ui/localization/strings.g.dart';
import 'package:template_app/ui/widgets/error_dialog.dart';
import 'package:template_app/ui/widgets/flushbar.dart';

class NoConnectionException implements Exception {
  @override
  String toString() => S.api_error.no_connection;
}

mixin ErrorHandlerMixin<T extends StatefulWidget> on State<T> {
  late final ErrorHandler errorHandler;

  @override
  void initState() {
    super.initState();
    errorHandler = ErrorHandler(context);
  }
}

class ErrorHandler {
  final BuildContext _context;

  late Map<Type, Function(dynamic e)> _defaultErrorHandlers;

  bool _messageLock = true;

  ErrorHandler(BuildContext context) : _context = context {
    _defaultErrorHandlers = {
      NoConnectionException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: S.api_error.no_connection,
          ),
        );
      },
      ServerConnectionException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: S.api_error.connection_timeout,
          ),
        );
      },
      ServerTimeoutException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: S.api_error.connection_timeout,
          ),
        );
      },
      SessionExpiredException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: (e as SessionExpiredException).prettyMessage(),
          ),
        );
      },
      UnauthorizedApiException: (e) {
        authStateNotificator.value = AuthState.NO_AUTH;
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: (e as UnauthorizedApiException).prettyMessage(),
          ),
        );
      },
      ForbiddenApiException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: (e as ForbiddenApiException).prettyMessage(),
          ),
        );
      },
      ApiException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: e.toString(),
          ),
        );
      },
      BadRequestApiException: (e) {
        _doWithLock(
          () => showTopPopUp(
            context: context,
            title: S.common.error,
            message: (e as BadRequestApiException).prettyMessage(),
          ),
        );
      },
    };
  }

  Future<void> handleError({
    required Exception e,
    StackTrace? stackTrace,
    Map<Type, Function(dynamic e)>? handlers,
  }) async {
    logW("Handle Error: ${e.runtimeType}");

    if (e is DioException) {
      e = e.error is ApiException ? e.error as ApiException : e;
      logW("Handle Error:re: ${e.runtimeType}");
    }

    // logW("Firebase exception logged $e \n$stackTrace");
    // FirebaseCrashlytics.instance.log("Exception handled($debugLabel): $e |\n| $stackTrace");
    // FirebaseCrashlytics.instance.recordError(e, stackTrace, fatal: true);
    // FirebaseCrashlytics.instance.sendUnsentReports();

    if (handlers != null) {
      for (var key in handlers.keys) {
        if (e.runtimeType == key) {
          handlers[key]?.call(e);
          return;
        }
      }
    }

    for (var key in _defaultErrorHandlers.keys) {
      if (e.runtimeType == key) {
        _defaultErrorHandlers[key]?.call(e);
        return;
      }
    }

    logW("DefaultErrorHandler: e.runtimeType: ${e.runtimeType}, e: $e");
    logW("DefaultErrorHandler: stackTrace: $stackTrace");
    logW("DefaultErrorHandler: messageLock: $_messageLock");

    _doWithLock(
      () => showErrorDialog(
        context: _context,
        title: S.common.error,
        message: e.toString(),
        exception: e,
        stackTrace: stackTrace,
      ),
    );
  }

  void _doWithLock(Function f) async {
    logD("doWithLock ($_messageLock)");
    if (_messageLock) {
      _messageLock = false;
      await f.call();
      _messageLock = true;
    }
  }
}
