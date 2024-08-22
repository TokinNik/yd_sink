import 'package:bloc/bloc.dart';

import 'log.dart';

class LoggingBlocObserver implements BlocObserver {
  final Log logger;

  LoggingBlocObserver(this.logger);

  @override
  void onCreate(BlocBase blocBase) {
    logger.i('[${blocBase.runtimeType}] created.');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.i('[${bloc.runtimeType}] ${event.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i('[${bloc.runtimeType}] ${transition.toString()}');
  }

  @override
  void onChange(BlocBase blocBase, Change change) {
    logger.i('[${blocBase.runtimeType}] ${change.toString()}');
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stacktrace) {
    logger.e('[${blocBase.runtimeType}]', error, stacktrace);
  }

  @override
  void onClose(BlocBase blocBase) {
    logger.i('[${blocBase.runtimeType}] closed.');
  }
}
