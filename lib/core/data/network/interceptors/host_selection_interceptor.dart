import 'package:dio/dio.dart';
import 'package:YDsync/core/app_global/setting_notifier.dart';
import 'package:YDsync/core/run_configs/app_configs.dart';
import 'package:YDsync/environment/loggers/log.dart';

class HostSelectionInterceptor extends Interceptor {
  HostSelectionInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var url = getConfigByType(settingStateNotificator.value.configType).baseServerUrl;

    RequestOptions flowOptions = options.copyWith(baseUrl: url);

    logD("HostSelectionInterceptor ${flowOptions.uri}");

    super.onRequest(flowOptions, handler);
  }
}
