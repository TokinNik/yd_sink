import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:YDsync/core/data/network/dio_utils/dio_extensions.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:YDsync/feature/auth/data/models/refresh_request.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final AuthRepository repository;
  final Dio dio;

  static const String authHeader = "Authorization";

  AuthInterceptor({required this.repository, required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final authToken = repository.token;
    debugPrint('TOKEN: $authToken');
    if (authToken != null) {
      var authTokenValue = authToken;
      options.headers['Authorization'] = 'Bearer $authTokenValue';
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final authToken = repository.token;

    if (err.response == null) return handler.next(err);

    if (err.response!.isUnauthorizedError || err.response!.isForbiddenError) {
      var options = err.response!.requestOptions;

      logD("MainAuthInterceptor:onError:checkToken: $authToken == ${options.headers[authHeader]} ?");

      if (authToken?.accessToken != options.headers[authHeader]) {
        options.headers[authHeader] = authToken;

        logD("MainAuthInterceptor:onError:repeat after token setup");
        return handler.resolve(await dio.fetch(options));
      }

      try {
        await repository.refresh(RefreshRequest(refreshToken: repository.token?.refreshToken ?? ""));
      } on DioException catch (e) {
        logD("MainAuthInterceptor:tryRefreshToken:error:${e.response?.statusCode}");
        repository.logout();
        return handler.reject(e);
      }

      options.headers[authHeader] = repository.token?.accessToken;

      logD("MainAuthInterceptor:onError:repeat after refresh");
      return handler.resolve(await dio.fetch(options));
    }

    return handler.next(err);
  }
}
