import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:YDsync/core/app_global/auth_notifier.dart';
import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:YDsync/feature/auth/data/models/login_request.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';

part 'temp_login_state.dart';

class TempLoginScreenCubit extends Cubit<TempLoginScreenState> {
  final AuthRepository _mainAuthApiRepository;

  TempLoginScreenCubit(this._mainAuthApiRepository) : super(const TempLoginScreenState());

  void login(String email, String password) async {
    emit(state.copyWith(login: state.login.loading()));

    try {
      await _mainAuthApiRepository.login(LoginRequest(email: email, password: password));

      authStateNotificator.value = AuthState.auth;

      emit(state.copyWith(login: state.login.success(true)));
    } on Exception catch (e, trace) {
      logE("TempLoginScreenBloc:init:exception = $e");
      logE("TempLoginScreenBloc:init:trace = $trace");

      emit(state.copyWith(login: state.login.error(e, trace: trace)));
    }
  }
}
