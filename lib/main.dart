import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/ui/localization/strings.g.dart';

import 'core/configs/configs.dart';
import 'core/singletons/environment/environments.dart';
import 'presentation/app/app_widget.dart';

void mainStarter(AppConfig config) {
  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Environment.init(config: config);

      Isolate.current.addErrorListener(
        RawReceivePort(
              (pair) async {
            final List<dynamic> errorAndStacktrace = pair;
            await Environment.recordError(
              errorAndStacktrace.first,
              errorAndStacktrace.last,
            );
          },
        ).sendPort,
      );
      if (Environment.isBlocLoggingEnabled) {
        Bloc.observer = Environment.blocObserver;
      }
      return runApp(TranslationProvider(child: const AppWidget()));
    },
    Environment.recordError,
  );
}
