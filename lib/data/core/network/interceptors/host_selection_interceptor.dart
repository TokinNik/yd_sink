import 'package:dio/dio.dart';
import 'package:template_app/core/app_global/config_notifier.dart';
import 'package:template_app/core/configs/app_configs.dart';
import 'package:template_app/core/core.dart';

class HostSelectionInterceptor extends Interceptor {
  HostSelectionInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var url = getConfigByType(configStateNotificator.value.configType).baseServerUrl;

    RequestOptions flowOptions = options.copyWith(
      baseUrl: url,
    );

    logD("HostSelectionInterceptor ${flowOptions.uri}");

    super.onRequest(flowOptions, handler);
  }
}
