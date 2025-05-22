import 'app_config.dart';

devConfig() => const AppConfig(
  schemaName: 'V1',
  baseServerUrl: 'https://cloud-api.yandex.net/v1',
  apiVersion: '',
  frontendUrl: '',
  type: ConfigType.YANDEX_DISK_V1,
);


AppConfig getConfigByType(ConfigType type) => switch (type) {
  ConfigType.YANDEX_DISK_V1 => devConfig(),
};
