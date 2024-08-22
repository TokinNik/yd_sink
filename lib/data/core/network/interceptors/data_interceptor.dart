import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/core/network/api_errors/exceptions.dart';
import 'package:template_app/data/core/network/dio_utils/dio_utils.dart';

class DataInterceptor extends Interceptor {
  DataInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logD("DataInterceptor:onError: ${err.type} $err");
    final exception = _parseError(err);
    logD("DataInterceptor:_parseError: ${exception.runtimeType} $exception");
    if (exception != null) {
      super.onError(err.copyWith(error: exception), handler);
    } else {
      super.onError(err, handler);
    }
  }

  Exception? _parseError(DioException dioError) {
    var requestName = dioError.response?.realUri;
    var parsedTitle;
    var parsedMessage;
    logD("DataInterceptor:_parseError:dioError.response = ${dioError.response}");
    logD("DataInterceptor:_parseError:dioError.response = ${dioError.response?.data.runtimeType}");
    logD("DataInterceptor:_parseError:dioError.response = ${dioError.response?.statusCode}");

    parsedTitle = dioError.response?.data["title"];
    parsedMessage = dioError.response?.data["message"];

    logD("DataInterceptor:_parseError:parsedTitle = $parsedTitle");
    logD("DataInterceptor:_parseError:parsedMessage = $parsedMessage");

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
        if (dioError is SocketException) {
          return ServerSocketConnectionException(
            originalException: dioError,
            trace: dioError.stackTrace,
            message: parsedTitle,
            requestName: requestName?.path,
          );
        }
        return ServerConnectionException(
          message: parsedTitle,
          requestName: requestName?.path,
          originalException: dioError,
          trace: dioError.stackTrace,
        );

      case DioExceptionType.receiveTimeout:
        return ServerTimeoutException(
          message: parsedTitle,
          requestName: requestName?.path,
          originalException: dioError,
          trace: dioError.stackTrace,
        );

      case DioExceptionType.badResponse:
        final response = dioError.response;
        if (response == null) return null;

        if (response.isClientError) {
          if (response.isBadRequestError) {
            logD("DataInterceptor:onError: is BadRequestApiException");
            return BadRequestApiException(
              message: parsedTitle,
              requestName: requestName?.path,
              originalException: dioError,
              trace: dioError.stackTrace,
            );
          }
          if (response.isUnauthorizedError) {
            logD("DataInterceptor:onError: is UnauthorizedApiException");
            return UnauthorizedApiException(
              message: parsedTitle,
              requestName: requestName?.path,
              originalException: dioError,
              trace: dioError.stackTrace,
            );
          }
          if (response.isForbiddenError) {
            logD("DataInterceptor:onError: is ForbiddenApiException");
            return ForbiddenApiException(
              message: parsedTitle,
              requestName: requestName?.path,
              originalException: dioError,
              trace: dioError.stackTrace,
            );
          }
          if (response.isNotFoundError) {
            logD("DataInterceptor:onError: is NotFoundApiException");
            return NotFoundApiException(
              message: parsedTitle,
              requestName: requestName?.path,
              originalException: dioError,
              trace: dioError.stackTrace,
            );
          }
        }

        if (response.isServerError) {
          return ServerApiException(
            message: parsedTitle,
            requestName: requestName?.path,
            originalException: dioError,
            trace: dioError.stackTrace,
            httpCode: response.statusCode,
          );
        }
        return UnknownApiException(
          message: parsedTitle,
          requestName: requestName?.path,
          originalException: dioError,
          trace: dioError.stackTrace,
          httpCode: response.statusCode,
        );

      case DioExceptionType.cancel:
        return null;

      case DioExceptionType.unknown:
        if (dioError is SocketException) {
          return ServerSocketConnectionException(
            message: parsedTitle,
            requestName: requestName?.path,
            originalException: dioError,
            trace: dioError.stackTrace,
          );
        }
        if (dioError is SessionExpiredException) {
          return dioError as SessionExpiredException;
        }
        return null;

      case DioExceptionType.badCertificate:
        return UnknownApiException(
          originalException: dioError,
          trace: dioError.stackTrace,
          message: parsedTitle ?? dioError.toString(),
          requestName: requestName?.path,
        );
    }
  }
}
