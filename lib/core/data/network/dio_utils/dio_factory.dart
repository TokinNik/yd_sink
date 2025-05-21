import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:YDsync/core/data/network/constants.dart';
import 'package:YDsync/core/data/network/interceptors/host_selection_interceptor.dart';
import 'package:YDsync/core/data/network/proxy/proxy.dart';
import 'package:YDsync/environment/loggers/log.dart';

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
    dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        maxWidth: 120,
        logPrint: logV,
        enabled: config.isHttpLoggingEnabled,
      ),
    );

    HttpOverrides.global = ProxyHttpOverrides(config.proxy?['host'], config.proxy?['port']);

    return dio;
  }
}

class DioConfig {
  String baseUrl;
  Map<String, String?>? proxy;
  bool isHttpLoggingEnabled;

  DioConfig({required this.baseUrl, this.proxy, this.isHttpLoggingEnabled = false});
}
