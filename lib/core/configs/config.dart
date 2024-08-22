class AppConfig {
  final String? schemaName;
  final String baseServerUrl;
  final String apiVersion;

  const AppConfig({
    this.schemaName,
    required this.baseServerUrl,
    required this.apiVersion,
  });
}
