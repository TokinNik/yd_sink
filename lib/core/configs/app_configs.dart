import 'app_config.dart';

devConfig() => const AppConfig(
      schemaName: 'DEV',
      baseServerUrl: 'https://rusguide-dev.aldera-soft.ru/api/v1/',
      apiVersion: '',
      frontendUrl: '',
      type: ConfigType.dev,
    );

qaConfig() => const AppConfig(
      schemaName: 'QA',
      baseServerUrl: 'https://rusguide-dev.aldera-soft.ru/api/v1/',
      apiVersion: '',
      frontendUrl: '',
      type: ConfigType.qa,
    );

demoConfig() => const AppConfig(
      schemaName: 'DEMO',
      baseServerUrl: 'https://rusguide-dev.aldera-soft.ru/api/v2/',
      apiVersion: '',
      frontendUrl: '',
      type: ConfigType.demo,
    );

prodConfig() => const AppConfig(
      baseServerUrl: 'https://rusguide-dev.aldera-soft.ru/api/v1/',
      apiVersion: '',
      frontendUrl: '',
      type: ConfigType.prod,
    );

AppConfig getConfigByType(ConfigType type) => switch (type) {
      ConfigType.dev => devConfig(),
      ConfigType.qa => qaConfig(),
      ConfigType.demo => demoConfig(),
      ConfigType.prod => prodConfig(),
    };
