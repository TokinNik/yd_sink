import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/app_global/auth_notifier.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/main_api/models/remote/login_request.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';
import 'package:template_app/presentation/app/screen_controller.dart';

part 'temp_login_state.dart';

class TempLoginScreenCubit extends Cubit<TempLoginScreenState> {
  final MainAuthApiRepository _mainAuthApiRepository;
  final ScreenController _screenController;

  ScreenController get screenController => _screenController;

  TempLoginScreenCubit(
    this._mainAuthApiRepository,
    this._screenController,
  ) : super(const TempLoginScreenState());

  void login(
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _mainAuthApiRepository
          .login(LoginRequest(email: email, password: password));

      authStateNotificator.value = AuthState.AUTH;
    } on Exception catch (e, trace) {
      logE("TempLoginScreenBloc:init:exception = $e");
      logE("TempLoginScreenBloc:init:trace = $trace");

      _screenController.onError?.call(e);
    }

    emit(state.copyWith(isLoading: false));
  }
}
