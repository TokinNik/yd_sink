import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/app_global/auth_notifier.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final MainAuthApiRepository _mainAuthApiRepository;

  SplashScreenBloc(
    this._mainAuthApiRepository,
  ) : super(const SplashScreenState()) {
    on<SplashScreenDidLoad>(init);
  }

  void init(
    SplashScreenEvent? value,
    Emitter<SplashScreenState> emit,
  ) async {
    logD("splash init");
    try {
      await _mainAuthApiRepository.init();
      var savedToken = _mainAuthApiRepository.token;
      var isUserSignIn = savedToken != null;

      logD("SplashScreenBloc:init:savedToken = $savedToken");
      logD("SplashScreenBloc:init:isUserSignIn = $isUserSignIn");

      authStateNotificator.value =
          isUserSignIn ? AuthState.AUTH : AuthState.NO_AUTH;
    } catch (e, trace) {
      logD("splash init err: $e, \n $trace");
      await _mainAuthApiRepository.logout();
      authStateNotificator.value = AuthState.NO_AUTH;
    }
  }

  void resetError(SplashScreenEvent? value, Emitter<SplashScreenState> emit) {
    emit(state.copyWith(error: () => null));
  }
}
