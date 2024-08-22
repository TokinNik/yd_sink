import 'package:flutter/material.dart';

import '../configs/app_config.dart';

class ConfigState {
  late final ConfigType configType;
  late final bool enableFileLog;
  late final ThemeMode themeMode;

  ConfigState({
    required this.configType,
    required this.enableFileLog,
    required this.themeMode,
  });
}

class ConfigStateNotificator extends ValueNotifier<ConfigState> {
  ConfigStateNotificator(super.value);

  void copyWith({
    ConfigType? configType,
    bool? enableFileLog,
    ThemeMode? themeMode,
  }) {
    super.value = ConfigState(
      configType: configType ?? value.configType,
      enableFileLog: enableFileLog ?? value.enableFileLog,
      themeMode: themeMode ?? value.themeMode,
    );
  }
}

ConfigStateNotificator configStateNotificator = ConfigStateNotificator(
    ConfigState(
        configType: ConfigType.dev,
        enableFileLog: false,
        themeMode: ThemeMode.system));
