import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:YDsync/core/data/local/drift.dart';
import 'package:YDsync/core/data/network/dio_utils/dio_factory.dart';
import 'package:YDsync/core/data/network/interceptors/auth_interceptor.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';
import 'package:YDsync/feature/auth/data/service/auth_service.dart';
import 'package:YDsync/feature/auth/data/service/main_auth_dao_service.dart';
import 'package:YDsync/feature/nasa_media/data/repository/nasa_repository.dart';
import 'package:YDsync/feature/nasa_media/data/service/nasa_dao_service.dart';
import 'package:YDsync/feature/nasa_media/data/service/nasa_service.dart';
import 'package:YDsync/feature/profile/data/repository/profile_repository.dart';
import 'package:YDsync/feature/profile/data/service/profile_service.dart';

const String _authDioTokenName = '_mainAuthFullDio';

Future<void> registerDataModule(GetIt container, DioConfig dioConfig) async {
  await _registerShared(container);

  // data
  _registerDrift(container);

  _registerDioClient(container, dioConfig);

  // data auth
  _registerAuthDioClient(container, dioConfig);

  // auth repo
  _registerMainAuth(container);

  // main repo
  _registerMain(container);
  _registerNasa(container);
}

void _registerDioClient(GetIt container, DioConfig dioConfig) {
  container.registerLazySingleton<Dio>(() => DioFactory.buildDioClient(dioConfig));
}

void _registerDrift(GetIt container) {
  container.registerSingleton<Drift>(Drift());
}

Future<void> _registerShared(GetIt container) async {
  container.registerSingletonAsync(SharedPreferences.getInstance);
  await container.isReady<SharedPreferences>();
}

void _registerAuthDioClient(GetIt container, DioConfig dioConfig) {
  container.registerLazySingleton<Dio>(instanceName: _authDioTokenName, () => DioFactory.buildDioClient(dioConfig));
}

void _registerNasa(GetIt container) {
  container.registerLazySingleton<NasaDaoService>(() => NasaDaoService(container.get()));

  container.registerLazySingleton<NasaService>(() => NasaService(container.get()));

  container.registerLazySingleton<NasaRepository>(() => NasaRepository(container.get(), container.get()));
}

void _registerMainAuth(GetIt container) {
  container.registerLazySingleton(() => const AuthDaoService());

  container.registerLazySingleton(() => AuthService(container.get(instanceName: _authDioTokenName)));
  final dio = container.get<Dio>(instanceName: _authDioTokenName);
  final repo = AuthRepository(container.get(), container.get());
  dio.interceptors.add(AuthInterceptor(repository: repo, dio: dio));
  container.registerLazySingleton(() => repo);
}

void _registerMain(GetIt container) {
  container.registerLazySingleton(() => ProfileService(container.get(instanceName: _authDioTokenName)));
  container.registerLazySingleton(() => ProfileRepository(container.get()));
}
