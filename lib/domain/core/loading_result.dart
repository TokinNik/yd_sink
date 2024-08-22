import 'dart:async';

class LoadingResult<T> {
  LoadingResult._();

  factory LoadingResult.error(Exception exception) => Error(exception);

  factory LoadingResult.success(T? data) => Success(data);

  Future<dynamic> when<R>({
    required Function(T?) success,
    Function(dynamic e)? error,
    // Map<Type, Function(dynamic e, BaseRouter router)>? handlers,
    bool ignoreErrors = false,
  }) async {
    final payload = this;
    if (payload is Success<T>) {
      return await success(payload.data);
    } else if (payload is Error<T>) {
      if (ignoreErrors) return;
      // return ErrorHandler.handleError(
      //   payload.exception,
      //   handlers: handlers,
      //   defaultErrorHandler: error,
      // );
      return await error?.call(payload.exception);
    }
  }
}

class Error<T> extends LoadingResult<T> {
  final Exception exception;

  Error(this.exception) : super._();
}

class Success<T> extends LoadingResult<T> {
  final T? data;

  Success(this.data) : super._();
}

class IgnoreException implements Exception {
  IgnoreException();

  @override
  String toString() {
    return "";
  }
}