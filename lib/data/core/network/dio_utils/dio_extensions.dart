import 'package:dio/dio.dart';
import 'package:template_app/core/core.dart';

extension ResponseErrors on Response {
  bool get isClientError => statusCode! >= 400 && statusCode! < 500;

  bool get isBadRequestError => statusCode == 400;

  bool get isUnauthorizedError => statusCode == 401;

  bool get isForbiddenError => statusCode == 403;

  bool get isNotFoundError => statusCode == 404;

  bool get isServerError => statusCode! >= 500 && statusCode! < 600;
}

mixin DioErrorUnwrapper {
  // иначе из интерсептора придёт DioException
  Future<T> run<T>(Future<T> request) async {
    try {
      return await request;
    } on DioException catch (e, trace) {
      logD("DioErrorUnwrapper: ${e.type}");
      logD("DioErrorUnwrapper: ${e.error}");
      logD("DioErrorUnwrapper: ${e.message}");
      logD("DioErrorUnwrapper: ${e.response}");
      Error.throwWithStackTrace(_tryParse(e), trace);
    }
  }

  Object _tryParse(DioException dioError) {
    final e = dioError.error;
    if (e == null) return dioError;
    return e;
  }
}
