import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:system_proxy/system_proxy.dart';
import 'package:template_app/core/configs/app_config.dart';
import 'package:template_app/core/singletons/loggers/file_logger.dart';
import 'package:template_app/core/singletons/loggers/log.dart';
import 'package:template_app/core/singletons/loggers/logging_bloc_obresver.dart';
import 'package:template_app/data/core/local/hive.dart';
import 'package:template_app/data/core/network/dio_utils/dio_factory.dart';
import 'package:template_app/di/di.dart';

import '../../app_global/config_notifier.dart';
import '../loggers/console_logger.dart';

abstract class Environment {
  static const bool isProd = !kDebugMode && !kProfileMode;

  static const bool isHttpLoggingEnabled = !isProd;

  static const bool isBlocLoggingEnabled = !isProd;

  static const bool canUseCustomUrl = !isProd;

  static const bool mockMode = false;

  static bool isTablet = false;

  static Log log = isProd ? Log() : ConsolePrettyLog();

  static FileLog fileLog = FileLog();

  static LoggingBlocObserver blocObserver = LoggingBlocObserver(log);

  static late AppConfig appConfig;
  static String apiVersion = appConfig.apiVersion;
  static String baseUrl = appConfig.baseServerUrl;
  static String serverUrl = '$baseUrl$apiVersion';
  static String appVersion = '';
  static late PackageInfo packageInfo;

  static const String androidNotificationChannelId =
      "android_notification_channel_id";

  static const String androidNotificationChannelName =
      "android_notification_channel_name";

  static setAppConfig(AppConfig config) {
    configStateNotificator.copyWith(configType: config.type);
    appConfig = config;
    apiVersion = appConfig.apiVersion;
    baseUrl = appConfig.baseServerUrl;
    serverUrl = '$baseUrl$apiVersion';
  }

  static Future<void> init({required AppConfig config}) async {
    setAppConfig(config);

    appVersion = await PackageInfo.fromPlatform().then(
        (info) => "${config.schemaName} ${info.version} (${info.buildNumber})");

    WidgetsFlutterBinding.ensureInitialized();

    await fileLog.init(enabled: false);

    packageInfo = await PackageInfo.fromPlatform();
    await HiveConfig.init();
    Map<String, String?>? proxy = await SystemProxy.getProxySettings();
    final DioConfig authConfig = DioConfig(
      baseUrl: serverUrl,
      proxy: proxy,
      isHttpLoggingEnabled: isHttpLoggingEnabled,
    );

    await initDI(authConfig);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // final fbOptions = Platform.isIOS ? CoreConstants.iosOptions : null;
    //await Firebase.initializeApp(options: fbOptions);
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // if (kDebugMode) {
    //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    // }
    // await GetIt.I.get<PushNotificationsManager>().init();
    // FirebaseCrashlytics.instance.crash();
  }

  static Future<void> recordFlutterError(
    FlutterErrorDetails flutterErrorDetails,
  ) async {
    log.e('RecordedFlutterError', flutterErrorDetails.exception,
        flutterErrorDetails.stack);
    logE('RecordedFlutterError',
        e: flutterErrorDetails.exception,
        stackTrace: flutterErrorDetails.stack);

    // return FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails);
  }

  static Future<void> recordError(
    dynamic exception,
    StackTrace stack,
  ) async {
    log.e('RecordedError', exception, stack);
    logE('RecordedError', e: exception, stackTrace: stack);
    // return FirebaseCrashlytics.instance
    //     .recordError(exception, stack, printDetails: !_isProd);
  }
}
