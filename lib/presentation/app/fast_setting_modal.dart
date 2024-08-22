import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:template_app/core/app_global/config_notifier.dart';
import 'package:template_app/core/core.dart';

class FastSettingModal extends StatelessWidget {
  Function toggleShow;

  FastSettingModal({super.key, required this.toggleShow});

  void _setConfigType(ConfigType item) {
    configStateNotificator.copyWith(configType: item);
  }

  void _setThemeMode(ThemeMode item) {
    configStateNotificator.copyWith(themeMode: item);
  }

  void _toggleFileLog(bool enable) {
    Environment.fileLog.init(enabled: enable);
    configStateNotificator.copyWith(enableFileLog: enable);
  }

  Future<void> _exportFileLog() async {
    String path = await Environment.fileLog.export();
    await Share.shareXFiles([XFile(path)], text: 'Share logs');
  }

  void _clearFileLog() {
    Environment.fileLog.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black87,
        child: ValueListenableBuilder(
            valueListenable: configStateNotificator,
            builder: (BuildContext context, value, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _themeModeRow(value),
                  _configTypeRow(value),
                  _enableFileLogRow(value),
                  TextButton(
                      onPressed: () => toggleShow(),
                      child: const Text("Закрыть"))
                ],
              );
            }),
      ),
    );
  }

  Widget _configTypeRow(ConfigState value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Выбор источника: ${value.configType.name}",
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              ...ConfigType.values.map((item) {
                return TextButton(
                    onPressed: () => _setConfigType(item),
                    child: Text(item.name));
              }),
            ],
          ),
        ],
      );

  Widget _themeModeRow(ConfigState value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Выбор темы: ${value.themeMode.name}",
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              ...ThemeMode.values.map((item) {
                return TextButton(
                    onPressed: () => _setThemeMode(item),
                    child: Text(item.name));
              }),
            ],
          ),
        ],
      );

  Widget _enableFileLogRow(ConfigState value) => Column(
        children: [
          Row(
            children: [
              const Text(
                "Включить запись в файл",
                style: TextStyle(color: Colors.white),
              ),
              Switch(
                  value: value.enableFileLog,
                  onChanged: (enable) => _toggleFileLog(enable)),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => _exportFileLog(),
                child: const Text(
                  "Экспорт",
                ),
              ),
              TextButton(
                onPressed: () => _clearFileLog(),
                child: const Text(
                  "Очистить",
                ),
              ),
            ],
          ),
        ],
      );
}
