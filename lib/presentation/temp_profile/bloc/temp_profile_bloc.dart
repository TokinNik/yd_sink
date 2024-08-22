import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/app_global/auth_notifier.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/main_api/models/remote/refresh_request.dart';
import 'package:template_app/data/main_api/repository/main_api_repository.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';
import 'package:template_app/domain/models/route_model.dart';
import 'package:template_app/presentation/app/screen_controller.dart';

part 'temp_profile_state.dart';

class TempProfileScreenCubit extends Cubit<TempProfileScreenState> {
  final MainApiRepository _mainApiRepository;
  final MainAuthApiRepository _mainAuthApiRepository;
  final ScreenController _screenController;

  ScreenController get screenController => _screenController;

  TempProfileScreenCubit(
    this._mainApiRepository,
    this._mainAuthApiRepository,
    this._screenController,
  ) : super(const TempProfileScreenState());

  void loadData() async {
    emit(state.copyWith(isLoading: true));

    try {
      logD("TempProfileScreenBloc:loadProfile:start");

      var result = await _mainApiRepository.routes();
      emit(state.copyWith(routes: result));
    } on Exception catch (e, trace) {
      logD("TempProfileScreenBloc:loadProfile:exception = $e");
      logD("TempProfileScreenBloc:loadProfile:trace = $trace");

      _screenController.onError?.call(e);
    }

    emit(state.copyWith(isLoading: false));
  }

  void logout() {
    _mainAuthApiRepository.logout();
    authStateNotificator.value = AuthState.NO_AUTH;
  }

  void refreshToken() async {
    emit(state.copyWith(isLoading: true));

    try {
      var refreshToken = _mainAuthApiRepository.token?.refreshToken ?? "";
      await _mainAuthApiRepository
          .refresh(RefreshRequest(refreshToken: refreshToken));

      emit(state.copyWith(isLoading: false));
    } on Exception catch (e, trace) {
      logD("TempProfileScreenBloc:refreshToken:exception = $e");
      logD("TempProfileScreenBloc:refreshToken:trace = $trace");

      _screenController.onError?.call(e);
    }

    emit(state.copyWith(isLoading: false));
  }
}
