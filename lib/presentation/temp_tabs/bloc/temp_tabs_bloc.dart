import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'temp_tabs_event.dart';

part 'temp_tabs_state.dart';

class TempTabsScreenBloc
    extends Bloc<TempTabsScreenEvent, TempTabsScreenState> {
  TempTabsScreenBloc() : super(const TempTabsScreenState());
}
