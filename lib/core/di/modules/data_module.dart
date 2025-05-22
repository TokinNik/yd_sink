import 'package:YDsync/core/data/network/dio_utils/dio_factory.dart';
import 'package:YDsync/core/data/network/interceptors/auth_interceptor.dart';
import 'package:YDsync/feature/auth/data/repository/main_auth_api_repository.dart';
import 'package:YDsync/feature/auth/data/service/main_auth_dao_service.dart';
import 'package:YDsync/feature/disk_sync/data/repository/disk_sync_repository.dart';
import 'package:YDsync/feature/disk_sync/data/service/disk_sync_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _authDioTokenName = '_mainAuthFullDio';

Future<void> registerDataModule(GetIt container, DioConfig dioConfig) async {
  await _registerShared(container);

  // _registerDioClient(container, dioConfig);

  // data auth
  _registerAuthDioClient(container, dioConfig);

  // auth repo
  _registerMainAuth(container);

  //yandex disk
  _registerYandexDisk(container);
}

Future<void> _registerShared(GetIt container) async {
  container.registerSingletonAsync(SharedPreferences.getInstance);
  await container.isReady<SharedPreferences>();
}

void _registerAuthDioClient(GetIt container, DioConfig dioConfig) {
  container.registerLazySingleton<Dio>(() => DioFactory.buildDioClient(dioConfig));
}

void _registerMainAuth(GetIt container) {
  container.registerLazySingleton(() => const AuthDaoService());

  final dio = container.get<Dio>();
  final repo = AuthRepository(container.get());
  dio.interceptors.add(AuthInterceptor(repository: repo, dio: dio));
  container.registerLazySingleton(() => repo);
}

void _registerYandexDisk(GetIt container) {
  container.registerLazySingleton(() => DiskSyncService(container.get()));
  container.registerLazySingleton(() => DiskSyncRepository(container.get()));
}
