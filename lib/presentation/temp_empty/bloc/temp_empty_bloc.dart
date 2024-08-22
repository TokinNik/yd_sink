import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_empty_event.dart';

part 'temp_empty_state.dart';

class TempEmptyScreenBloc
    extends Bloc<TempEmptyScreenEvent, TempEmptyScreenState> {
  TempEmptyScreenBloc() : super(const TempEmptyScreenState());
}
