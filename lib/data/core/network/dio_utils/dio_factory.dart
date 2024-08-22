import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:template_app/core/singletons/loggers/log.dart';
import 'package:template_app/data/core/network/constants.dart';
import 'package:template_app/data/core/network/interceptors/auth_interceptor.dart';
import 'package:template_app/data/core/network/interceptors/data_interceptor.dart';
import 'package:template_app/data/core/network/proxy/proxy.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';

import '../interceptors/host_selection_interceptor.dart';

export 'package:dio/dio.dart' show Dio;

class DioFactory {
  static final BaseOptions _defaultOptions = BaseOptions(
    connectTimeout: ApiConstants.defaultConnectTimeout,
    receiveTimeout: ApiConstants.defaultReceiveTimeout,
    sendTimeout: ApiConstants.defaultSendTimeout,
  );

  static Dio buildDioClient(DioConfig config) {
    final dio = Dio(_defaultOptions);
    dio.options.baseUrl = config.baseUrl;
    dio.interceptors.add(HostSelectionInterceptor());
    dio.interceptors.add(DataInterceptor());
    if (config.isHttpLoggingEnabled) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          maxWidth: 120,
          logPrint: logV,
        ),
      );
    }
    HttpOverrides.global = ProxyHttpOverrides(
      config.proxy?['host'],
      config.proxy?['port'],
    );
    return dio;
  }

  static Dio buildAuthorizedClient(
    MainAuthApiRepository repository,
    DioConfig config,
  ) {
    final dio = Dio(_defaultOptions);
    dio.options.baseUrl = config.baseUrl;
    dio.interceptors.add(HostSelectionInterceptor());
    dio.interceptors.add(
      AuthInterceptor(
        repository: repository,
        dio: dio,
      ),
    );

    if (config.isHttpLoggingEnabled) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          maxWidth: 120,
          logPrint: logV,
        ),
      );
    }
    HttpOverrides.global = ProxyHttpOverrides(
      config.proxy?['host'],
      config.proxy?['port'],
    );
    dio.interceptors.add(DataInterceptor());
    return dio;
  }
}

class DioConfig {
  String baseUrl;
  Map<String, String?>? proxy;
  bool isHttpLoggingEnabled;

  DioConfig({
    required this.baseUrl,
    this.proxy,
    this.isHttpLoggingEnabled = false,
  });
}
