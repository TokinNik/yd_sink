import 'package:hive/hive.dart';
import 'package:template_app/core/core.dart';

class BaseStorage<T> {
  final String key;

  Box<T>? box;

  var listener;

  BaseStorage({
    required this.key,
  }) {
    getBox;
    // maybe not ok, but work
  }

  Future<Box<T>> get getBox async {
    logD("getBox $key: is null = ${box == null}");
    box ??= await Hive.openBox(key);
    return Future.value(box);
  }

  Future<T?> loadData() => getBox.then((box) async {
        var data = box.get(key, defaultValue: null);
        logD("load data in box $key\n$data");
        // logD("load data in box (check all) $key\n${box.values}");
        return data;
      });

  Future<T?> getData(dynamic key) => getBox.then((box) async {
        logD("get data in box ${this.key} by key $key");
        return box.get(key, defaultValue: null);
      });

  Future<void> deleteData(dynamic key) => getBox.then((box) async {
        logD("delete data in box ${this.key} by key $key");
        var check = await box.get(key);
        logD("check delete data in box ${this.key} by key $key = $check");
        return await box.delete(key);
      });

  Future<List<T>?> loadAllData() => getBox.then((box) async {
        logD("load all data in box $key \n ${box.values}");
        return await box.values.toList();
      });

  Future<void> saveData(T dto) => getBox.then((box) async {
        logD("set data in box $key\n$dto");
        await box.put(key, dto);
        logD("set data in box (check it) $key\n${box.values}");
      });

  Future<dynamic> addData(T dto, {String? key}) => getBox.then((box) async {
        logD("add data in box ${this.key}\n $dto\nkey: $key");
        if (key == null) {
          return await box.add(dto);
        } else {
          await box.put(key, dto);
          return key;
        }
      });

  Future<void> saveAllData(List<T> dtoList) => getBox.then((box) async {
        logD("save all data in box $key");
        var keys = await box.addAll(dtoList);
        logD(
            "save all data in box (check it) keys = $keys $key\n${box.values.length}");
      });

  Future<void> clear() => getBox.then((box) async {
        logD("clear data in box $key");
        await box.clear();
      });
}
