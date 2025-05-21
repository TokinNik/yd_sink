import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:YDsync/environment/environments.dart';

part 'welcome_screen_state.dart';

class WelcomeScreenBloc extends Cubit<WelcomeScreenState> {
  WelcomeScreenBloc() : super(const WelcomeScreenState());

  void init() async {
    try {
      emit(state.copyWith(isLoading: true));
    } on Exception catch (e, trace) {
      Environment.recordError(e, trace);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
