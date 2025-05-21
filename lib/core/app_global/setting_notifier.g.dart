// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingState _$SettingStateFromJson(Map<String, dynamic> json) => SettingState(
  configType: $enumDecode(_$ConfigTypeEnumMap, json['configType']),
  enableFileLog: json['enableFileLog'] as bool,
  themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
);

Map<String, dynamic> _$SettingStateToJson(SettingState instance) => <String, dynamic>{
  'configType': _$ConfigTypeEnumMap[instance.configType]!,
  'enableFileLog': instance.enableFileLog,
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
};

const _$ConfigTypeEnumMap = {
  ConfigType.dev: 'dev',
  ConfigType.qa: 'qa',
  ConfigType.demo: 'demo',
  ConfigType.prod: 'prod',
};

const _$ThemeModeEnumMap = {ThemeMode.system: 'system', ThemeMode.light: 'light', ThemeMode.dark: 'dark'};
