import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/singletons/loggers/log.dart';
import 'package:template_app/presentation/app/screen_controller.dart';

part '{{name.snakeCase()}}_screen_state.dart';

class {{name.pascalCase()}}ScreenBloc extends Cubit<{{name.pascalCase()}}ScreenState> {
  final ScreenController _screenController;

  ScreenController get screenController => _screenController;

  {{name.pascalCase()}}ScreenBloc(
      this._screenController,
  ) : super(const {{name.pascalCase()}}ScreenState());

  void nothing() async {
    emit(state.copyWith(isLoading: true));

    try {

    } on Exception catch (e, trace) {
      logE("{{name.pascalCase()}}Bloc:init:exception = $e");
      logE("{{name.pascalCase()}}:init:trace = $trace");

      _screenController.onError?.call(e);
    }

    emit(state.copyWith(isLoading: false));
  }
}
