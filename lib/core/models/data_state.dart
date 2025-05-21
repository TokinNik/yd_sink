import 'package:dio/dio.dart';
import 'package:YDsync/core/i10n/strings.g.dart';
import 'package:YDsync/core/utils/extensions/list_extensions.dart';

class PageDataState<T> extends DataState<List<T>> {
  final bool isRefresh;
  final int page;
  final int pageSize;
  final int? pageCount;
  final int? totalCount;

  const PageDataState({
    this.isRefresh = false,
    this.page = 1,
    this.pageSize = 10,
    this.pageCount,
    this.totalCount,
    super.isLoading,
    super.exception,
    super.data,
  });

  bool get isEndPage => pageCount != null && page > pageCount!;

  @override
  PageDataState<T> copyWith({
    bool? isRefresh,
    int? page,
    int? pageSize,
    int? Function()? pageCount,
    int? Function()? totalCount,
    bool? isLoading,
    ShowedException? Function()? exception,
    StackTrace? Function()? trace,
    List<T>? data,
  }) {
    return PageDataState<T>(
      isRefresh: isRefresh ?? this.isRefresh,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      isLoading: isLoading ?? this.isLoading,
      exception: exception == null ? this.exception : exception.call(),
      pageCount: pageCount == null ? this.pageCount : pageCount.call(),
      totalCount: totalCount == null ? this.totalCount : totalCount.call(),
      data: data ?? this.data,
    );
  }

  bool inProgress() {
    return isLoading || isRefresh;
  }

  PageDataState<T> more({bool isRefresh = false}) {
    if (isRefresh) {
      return refresh();
    }
    return next();
  }

  PageDataState<T> refresh() {
    return copyWith(
      isLoading: false,
      isRefresh: true,
      exception: () => null,
      pageCount: () => null,
      totalCount: () => null,
      page: 1,
    );
  }

  PageDataState<T> next() {
    return copyWith(isLoading: true, isRefresh: false, exception: () => null);
  }

  @override
  PageDataState<T> success(List<T> data, {int? pageCount, int? totalCount}) {
    if (isEndPage) {
      return this;
    }
    if (data.isEmpty && !isRefresh) {
      return copyWith(
        isLoading: false,
        isRefresh: false,
        exception: () => null,
        pageCount: () => pageCount,
        totalCount: () => totalCount,
        data: data,
      );
    }

    return copyWith(
      isLoading: false,
      isRefresh: false,
      data: isRefresh ? data : this.data?.plusAll(data) ?? data,
      page: this.page + 1,
      exception: () => null,
      pageCount: () => pageCount,
      totalCount: () => totalCount,
    );
  }

  @override
  PageDataState<T> error(Exception e, {StackTrace? trace, bool isShowed = false}) {
    return copyWith(
      isLoading: false,
      isRefresh: false,
      exception: () => ShowedException(e, trace)..isShowed = isShowed,
      trace: () => trace,
    );
  }
}

class DataState<T> {
  final bool isLoading;
  final ShowedException? exception;
  final T? data;

  const DataState({this.isLoading = false, this.exception, this.data});

  bool get isError => exception != null;

  bool get isSuccess => data != null && !isLoading && exception == null;

  DataState<T> copyWith({bool? isLoading, ShowedException? Function()? exception, T? data}) {
    return DataState(
      isLoading: isLoading ?? this.isLoading,
      exception: exception == null ? this.exception : exception.call(),
      data: data ?? this.data,
    );
  }

  DataState<T> loading() {
    return this.copyWith(isLoading: true, exception: () => null);
  }

  DataState<T> success(T data) {
    return this.copyWith(isLoading: false, data: data);
  }

  DataState<T> error(Exception e, {StackTrace? trace, bool isShowed = false}) {
    return this.copyWith(isLoading: false, data: data, exception: () => ShowedException(e, trace)..isShowed = isShowed);
  }

  DataState<T> clear() {
    return DataState<T>();
  }
}

class ShowedException {
  final Exception exception;
  final StackTrace? trace;
  bool isShowed = false;

  ShowedException(this.exception, this.trace);

  String? get parsedDioError {
    if (exception is! DioException) return null;

    final response = (exception as DioException).response;

    String? parsedError;

    if (response?.data! is Map) {
      parsedError = response?.data['errors']?.values
          .map((e) => e.fold('', (pv, e) => '$pv\n$e'))
          ?.fold('', (pv, e) => '$pv\n$e');

      parsedError ??= response?.data['message'];

      return parsedError;
    }
    return null;
  }

  String? get defaultDioError {
    if (exception is! DioException) return null;

    return S.api_error.server(httpCode: (exception as DioException).response?.statusCode ?? 0);
  }

  @override
  String toString() {
    return 'ShowedException{exception: $exception, isShowed: $isShowed\ntrace: $trace,}';
  }
}
