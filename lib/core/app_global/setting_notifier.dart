import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../run_configs/app_config.dart';

part 'setting_notifier.g.dart';

@JsonSerializable()
class SettingState {
  late final ConfigType configType;
  late final bool enableFileLog;
  late final ThemeMode themeMode;

  SettingState({required this.configType, required this.enableFileLog, required this.themeMode});

  factory SettingState.fromJson(Map<String, dynamic> json) => _$SettingStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingStateToJson(this);
}

class SettingStateNotificator extends ValueNotifier<SettingState> {
  SettingStateNotificator(super.value);

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("settings_notifier", json.encode(value.toJson()));
  }

  Future load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var string = prefs.getString("settings_notifier");
    if (string != null) {
      var jsonValue = json.decode(string);
      value = SettingState.fromJson(jsonValue);
    }
  }

  void copyWith({ConfigType? configType, bool? enableFileLog, ThemeMode? themeMode}) {
    super.value = SettingState(
      configType: configType ?? value.configType,
      enableFileLog: enableFileLog ?? value.enableFileLog,
      themeMode: themeMode ?? value.themeMode,
    );
    save();
  }
}

SettingStateNotificator settingStateNotificator = SettingStateNotificator(
  SettingState(configType: ConfigType.YANDEX_DISK_V1, enableFileLog: false, themeMode: ThemeMode.system),
);
