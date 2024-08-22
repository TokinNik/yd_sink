import 'package:dio/dio.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/core/network/api_errors/exceptions.dart';
import 'package:template_app/data/core/network/dio_utils/dio_extensions.dart';
import 'package:template_app/data/main_api/models/remote/refresh_request.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final MainAuthApiRepository repository;
  final Dio dio;

  static const String authHeader = "Authorization";

  AuthInterceptor({
    required this.repository,
    required this.dio,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = repository.token;

    if (authToken == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: SessionExpiredException(),
        ),
      );
    } else {
      var authTokenValue = authToken;
      logD("AuthInterceptor:onRequest:Token: $authTokenValue");
      options.headers[authHeader] = authTokenValue.accessToken;
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    logD("AuthInterceptor:onError: $error");
    logD("AuthInterceptor:onError: ${error.response}");
    logD("AuthInterceptor:onError: ${error.response?.statusCode}");

    final authToken = repository.token;

    if (error.response == null) return handler.next(error);

    if (error.response!.isUnauthorizedError ||
        error.response!.isForbiddenError) {
      var options = error.response!.requestOptions;

      logD(
          "AuthInterceptor:onError:checkToken: $authToken == ${options.headers[authHeader]} ?");

      if (authToken?.accessToken != options.headers[authHeader]) {
        options.headers[authHeader] = authToken;

        logD("AuthInterceptor:onError:repeat after token setup");
        return handler.resolve(await dio.fetch(options));
      }

      try {
        await repository.refresh(
            RefreshRequest(refreshToken: repository.token?.refreshToken ?? ""));
      } on UnauthorizedApiException catch (e, trace) {
        logD("AuthInterceptor:tryRefreshToken:UnauthorizedApiException: $e");
        repository.logout();
        return handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: SessionExpiredException(
              httpCode: e.httpCode,
              message: e.message,
              requestName: e.requestName,
              originalException: e,
              trace: trace,
            ),
          ),
        );
      } on ForbiddenApiException catch (e, trace) {
        logD("AuthInterceptor:tryRefreshToken:ForbiddenApiException: $e");
        repository.logout();
        return handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: SessionExpiredException(
              httpCode: e.httpCode,
              message: e.message,
              requestName: e.requestName,
              originalException: e,
              trace: trace,
            ),
          ),
        );
      } on DioException catch (e) {
        logD("AuthInterceptor:tryRefreshToken:error:${e.response?.statusCode}");
        repository.logout();
        return handler.reject(e);
      }

      options.headers[authHeader] = repository.token?.accessToken;

      logD("AuthInterceptor:onError:repeat after refresh");
      return handler.resolve(await dio.fetch(options));
    }
    return handler.next(error);
  }
}
