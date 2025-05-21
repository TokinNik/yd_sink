import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:YDsync/core/app_global/auth_notifier.dart';
import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:YDsync/feature/auth/data/models/register_request.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc extends Cubit<RegisterScreenState> {
  final AuthRepository _mainAuthApiRepository;

  RegisterScreenBloc(this._mainAuthApiRepository) : super(const RegisterScreenState());

  void register(String email, String password) async {
    emit(state.copyWith(register: state.register.loading()));

    try {
      await _mainAuthApiRepository.register(RegisterRequest(email: email, password: password));

      authStateNotificator.value = AuthState.auth;

      emit(state.copyWith(register: state.register.success(true)));
    } on Exception catch (e, trace) {
      logE("RegisterScreenBloc:init:exception = $e");
      logE("RegisterScreenBloc:init:trace = $trace");

      emit(state.copyWith(register: state.register.error(e, trace: trace)));
    }
  }
}
