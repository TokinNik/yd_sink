import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/app_global/auth_notifier.dart';
import 'package:template_app/core/singletons/loggers/log.dart';
import 'package:template_app/data/main_api/models/remote/register_request.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';
import 'package:template_app/presentation/app/screen_controller.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc extends Cubit<RegisterScreenState> {
  final MainAuthApiRepository _mainAuthApiRepository;
  final ScreenController _screenController;

  ScreenController get screenController => _screenController;

  RegisterScreenBloc(
    this._mainAuthApiRepository,
    this._screenController,
  ) : super(const RegisterScreenState());

  void register(
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _mainAuthApiRepository
          .register(RegisterRequest(email: email, password: password));

      authStateNotificator.value = AuthState.AUTH;
    } on Exception catch (e, trace) {
      logE("RegisterScreenBloc:init:exception = $e");
      logE("RegisterScreenBloc:init:trace = $trace");

      _screenController.onError?.call(e);
    }

    emit(state.copyWith(isLoading: false));
  }
}
