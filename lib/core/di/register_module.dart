import 'package:get_it/get_it.dart';
import 'package:YDsync/core/data/network/dio_utils/dio_factory.dart';

import 'modules/data_module.dart';

GetIt getIt = GetIt.instance;

Future<void> initDI(DioConfig config) async {
  await registerDataModule(getIt, config);
}
