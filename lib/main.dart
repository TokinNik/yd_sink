import 'dart:async';
import 'dart:isolate';

import 'package:YDsync/core/i10n/strings.g.dart';
import 'package:YDsync/environment/environments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/run_configs/app_config.dart';
import 'feature/app/app_widget.dart';

void mainStarter(AppConfig config) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Environment.init(config: config);

    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await Environment.recordError(errorAndStacktrace.first, errorAndStacktrace.last);
      }).sendPort,
    );
    if (Environment.isBlocLoggingEnabled) {
      Bloc.observer = Environment.blocObserver;
    }
    return runApp(TranslationProvider(child: const AppWidget()));
  }, Environment.recordError);
}
