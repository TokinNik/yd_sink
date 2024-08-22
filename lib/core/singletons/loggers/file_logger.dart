import 'dart:async';
import 'dart:io';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:path_provider/path_provider.dart';
import 'log.dart';

class FileLog implements Log {
  final Completer _completerExportPath = Completer<String>();

  Future<void> init({bool enabled = true}) async {
    // init
    await FlutterLogs.initLogs(
        logLevelsEnabled: [
          LogLevel.INFO,
          LogLevel.WARNING,
          LogLevel.ERROR,
          LogLevel.SEVERE
        ],
        timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
        directoryStructure: DirectoryStructure.FOR_DATE,
        logFileExtension: LogFileExtension.LOG,
        logsWriteDirectoryName: "AppLogs",
        logsExportDirectoryName: "AppLogs/Exported",
        debugFileOperations: true,
        isDebuggable: false,
        enabled: enabled);

    // add listener
    FlutterLogs.channel.setMethodCallHandler((call) async {
      if (call.method == 'logsExported') {
        var zipName = call.arguments.toString();

        Directory? externalDirectory;

        if (Platform.isIOS) {
          externalDirectory = await getApplicationDocumentsDirectory();
        } else {
          externalDirectory = await getExternalStorageDirectory();
        }

        _completerExportPath.complete("${externalDirectory?.path}/$zipName");
      }
    });
  }

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logInfo("app", "debug", message);
    trace(error, stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logError("app", "error", message);
    trace(error, stackTrace);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logInfo("app", "info", message);
    trace(error, stackTrace);
  }

  @override
  void v(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logInfo("app", "v", message);
    trace(error, stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logWarn("app", "warn", message);
    trace(error, stackTrace);
  }

  @override
  void wtf(message, [error, StackTrace? stackTrace]) {
    FlutterLogs.logWarn("app", "wtf", message);
    trace(error, stackTrace);
  }

  void trace([error, StackTrace? stackTrace]) {
    if (error == null && stackTrace == null) return;

    FlutterLogs.logErrorTrace("app", "trace", stackTrace.toString(), error);
  }

  Future<String> export() async {
    FlutterLogs.exportLogs(exportType: ExportType.ALL);
    return _completerExportPath.future as FutureOr<String>;
  }

  void clearAll() {
    FlutterLogs.clearLogs();
  }
}
