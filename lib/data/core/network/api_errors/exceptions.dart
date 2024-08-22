import 'package:dio/dio.dart';
import 'package:template_app/ui/localization/strings.g.dart';

sealed class ApiException implements Exception {
  final int? httpCode;
  final String? message;
  final String? requestName;
  final Object? originalException;
  final StackTrace? trace;

  ApiException({
    this.httpCode,
    this.message,
    this.requestName,
    this.originalException,
    this.trace,
  }) : super();

  String prettyMessage();

  @override
  String toString() {
    return 'ApiException(${this.runtimeType}):' +
        '\nrequest: $requestName' +
        '\nhttpCode: $httpCode' +
        '\nmessage: $message' +
        // '\ntrace: $trace' +
        '\noriginalException: $originalException';
  }
}

// 400
class BadRequestApiException extends ApiException {
  BadRequestApiException({
    super.httpCode = 400,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => S.api_error.bad_request(
        method: (originalException is DioException)
            ? (originalException as DioException).response?.realUri ?? ""
            : "",
        httpCode: httpCode.toString(),
      );
}

//401
class UnauthorizedApiException extends ApiException {
  UnauthorizedApiException({
    super.httpCode = 401,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => S.api_error.session_expired;
}

//403
class ForbiddenApiException extends ApiException {
  ForbiddenApiException({
    super.httpCode = 403,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => S.api_error.session_expired;
}

//404
class NotFoundApiException extends ApiException {
  NotFoundApiException({
    super.httpCode = 404,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//500-600
class ServerApiException extends ApiException {
  ServerApiException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//unknown
class UnknownApiException extends ApiException {
  UnknownApiException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//connectionTimeout, sendTimeout
class ServerConnectionException extends ApiException {
  ServerConnectionException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//SocketException
class ServerSocketConnectionException extends ApiException {
  ServerSocketConnectionException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//receiveTimeout
class ServerTimeoutException extends ApiException {
  ServerTimeoutException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => "";
}

//access token expired + refresh token expired || refresh failed
class SessionExpiredException extends ApiException {
  SessionExpiredException({
    super.httpCode,
    super.message,
    super.requestName,
    super.originalException,
    super.trace,
  });

  @override
  String prettyMessage() => S.api_error.session_expired;
}
