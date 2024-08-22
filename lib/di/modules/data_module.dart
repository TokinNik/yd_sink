import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:template_app/data/core/local/drift.dart';
import 'package:template_app/data/core/local/isar.dart';
import 'package:template_app/data/core/network/dio_utils/dio_factory.dart';
import 'package:template_app/data/main_api/repository/main_api_repository.dart';
import 'package:template_app/data/main_api/repository/main_auth_api_repository.dart';
import 'package:template_app/data/main_api/service/main_api_service.dart';
import 'package:template_app/data/main_api/service/main_auth_api_service.dart';
import 'package:template_app/data/main_api/service/main_auth_dao_service.dart';
import 'package:template_app/data/nivl_template_api/repository/nivl_repository.dart';
import 'package:template_app/data/nivl_template_api/service/nivl_dao_service.dart';
import 'package:template_app/data/nivl_template_api/service/nivl_service.dart';

const String _tokenClient = '_tokenClient';

Future<void> registerDataModule(GetIt container, DioConfig dioConfig) async {
  // data
  await _registerIsar(container);
  _registerDrift(container);
  _registerDioClient(container, dioConfig);

  // auth repo
  _registerMainAuth(container);

  // data auth
  _registerAuthorizedDioToken(container, dioConfig);

  // main repo
  _registerMain(container);
  _registerNIVL(container);
}

void _registerDioClient(GetIt container, DioConfig dioConfig) {
  container.registerLazySingleton<Dio>(
    () => DioFactory.buildDioClient(dioConfig),
    instanceName: _tokenClient,
  );
}

void _registerDrift(GetIt container) {
  container.registerSingleton<Drift>(Drift());
}

Future<void> _registerIsar(GetIt container) async {
  container.registerSingletonAsync(IsarConfig.init);
  await container.isReady<Isar>();
}

void _registerAuthorizedDioToken(GetIt container, DioConfig dioConfig) {
  container.registerLazySingleton<Dio>(
    () => DioFactory.buildAuthorizedClient(
      container.get(),
      dioConfig,
    ),
  );
}

void _registerNIVL(GetIt container) {
  container.registerLazySingleton<NivlDaoService>(
    () => NivlDaoService(container.get()),
  );

  container.registerLazySingleton<NIVLService>(
    () => NIVLServiceImpl(container.get()),
  );

  container.registerLazySingleton<NIVLRepository>(
    () => NIVLRepositoryImpl(container.get(), container.get()),
  );
}

void _registerMainAuth(GetIt container) {
  container.registerLazySingleton(() => MainAuthDaoService(container.get()));
  container.registerLazySingleton(
      () => MainAuthApiService(container.get(instanceName: _tokenClient)));
  container.registerLazySingleton(() => MainAuthApiRepository(
        container.get(),
        container.get(),
      ));
}

void _registerMain(GetIt container) {
  container.registerLazySingleton(() => MainApiService(container.get()));
  container.registerLazySingleton(() => MainApiRepository(container.get()));
}
