import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name.snakeCase()}}_screen_event.dart';
part '{{name.snakeCase()}}_screen_state.dart';

class {{name.pascalCase()}}ScreenBloc
    extends Bloc<{{name.pascalCase()}}ScreenEvent, {{name.pascalCase()}}ScreenState> {
  {{name.pascalCase()}}ScreenBloc() : super(const {{name.pascalCase()}}ScreenState());
}
