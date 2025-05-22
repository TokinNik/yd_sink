enum ConfigType { YANDEX_DISK_V1 }

class AppConfig {
  final String? schemaName;
  final String baseServerUrl;
  final String apiVersion;
  final String frontendUrl;
  final ConfigType type;

  const AppConfig({
    this.schemaName,
    required this.baseServerUrl,
    required this.apiVersion,
    required this.frontendUrl,
    required this.type,
  });
}
