import 'package:get_it/get_it.dart';
import 'package:template_app/data/core/network/dio_utils/dio_factory.dart';

import 'modules/modules.dart';

GetIt getIt = GetIt.instance;

Future<void> initDI(DioConfig config) async {
  await registerDataModule(getIt, config);
  registerDomainModule(getIt);
  registerPresentationModule(getIt);
}
