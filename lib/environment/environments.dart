import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:system_proxy/system_proxy.dart';
import 'package:YDsync/core/app_global/setting_notifier.dart';
import 'package:YDsync/core/data/network/dio_utils/dio_factory.dart';
import 'package:YDsync/core/di/register_module.dart';
import 'package:YDsync/core/run_configs/app_config.dart';
import 'package:YDsync/environment/loggers/console_logger.dart';
import 'package:YDsync/environment/loggers/file_logger.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:YDsync/environment/loggers/logging_bloc_obresver.dart';

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
  static late PackageInfo packageInfo;

  static String apiVersion = appConfig.apiVersion;
  static String baseUrl = appConfig.baseServerUrl;
  static String serverUrl = '$baseUrl$apiVersion';
  static String appVersion = '';

  static const String androidNotificationChannelId = "android_notification_channel_id";
  static const String androidNotificationChannelName = "android_notification_channel_name";

  static setAppConfig(AppConfig config) {
    settingStateNotificator.copyWith(configType: config.type);
    appConfig = config;
    apiVersion = appConfig.apiVersion;
    baseUrl = appConfig.baseServerUrl;
    serverUrl = '$baseUrl$apiVersion';
  }

  static Future<void> init({required AppConfig config}) async {
    await settingStateNotificator.load();
    setAppConfig(config);

    packageInfo = await PackageInfo.fromPlatform();
    appVersion = "${config.schemaName} ${packageInfo.version} (${packageInfo.buildNumber})";

    await fileLog.init(enabled: true);
    final DioConfig authConfig = DioConfig(
      baseUrl: serverUrl,
      proxy: await SystemProxy.getProxySettings(),
      isHttpLoggingEnabled: isHttpLoggingEnabled,
    );

    await initDI(authConfig);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // final fbOptions = Platform.isIOS ? CoreConstants.iosOptions : null;
    //await Firebase.initializeApp(options: fbOptions);
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // if (kDebugMode) {
    //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    // }
    // await GetIt.I.get<PushNotificationsManager>().init();
    // FirebaseCrashlytics.instance.crash();
  }

  static Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) async {
    logE('RecordedFlutterError', e: flutterErrorDetails.exception, stackTrace: flutterErrorDetails.stack);

    // return FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails);
  }

  static Future<void> recordError(dynamic exception, StackTrace stack) async {
    logE('RecordedError', e: exception, stackTrace: stack);
    // return FirebaseCrashlytics.instance
    //     .recordError(exception, stack, printDetails: !_isProd);
  }
}
