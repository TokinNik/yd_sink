import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:YDsync/core/app_global/auth_notifier.dart';
import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:YDsync/feature/auth/data/models/refresh_request.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';
import 'package:YDsync/feature/profile/data/repository/profile_repository.dart';
import 'package:YDsync/feature/profile/models/route_model.dart';

part 'profile_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  final ProfileRepository _mainApiRepository;
  final AuthRepository _mainAuthApiRepository;

  ProfileScreenCubit(this._mainApiRepository, this._mainAuthApiRepository) : super(const ProfileScreenState());

  Future<void> loadData() async {
    emit(state.copyWith(routes: state.routes.loading()));

    try {
      logD("TempProfileScreenBloc:loadProfile:start");

      var result = await _mainApiRepository.routes();
      emit(state.copyWith(routes: state.routes.success(result)));
    } on Exception catch (e, trace) {
      logD("TempProfileScreenBloc:loadProfile:exception = $e");
      logD("TempProfileScreenBloc:loadProfile:trace = $trace");

      emit(state.copyWith(routes: state.routes.error(e, trace: trace)));
    }
  }

  void logout() {
    _mainAuthApiRepository.logout();
    authStateNotificator.value = AuthState.noAuth;
  }

  void refreshToken() async {
    emit(state.copyWith(tokenRefresh: state.tokenRefresh.loading()));

    try {
      var refreshToken = _mainAuthApiRepository.token?.refreshToken ?? "";
      await _mainAuthApiRepository.refresh(RefreshRequest(refreshToken: refreshToken));

      emit(state.copyWith(tokenRefresh: state.tokenRefresh.success(true)));
    } on Exception catch (e, trace) {
      logD("TempProfileScreenBloc:refreshToken:exception = $e");
      logD("TempProfileScreenBloc:refreshToken:trace = $trace");

      emit(state.copyWith(tokenRefresh: state.tokenRefresh.error(e, trace: trace)));
    }
  }
}
