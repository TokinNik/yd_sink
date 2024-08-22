import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';

abstract class HiveConfig {
  static const String hiveDir = "Hive";

  static Future<void> init() async {
    await _initFlutter(hiveDir);
    _registerAdapters();
  }

  static void _registerAdapters() {

  }

}

/// Hive Types IDs
/// Make sure to use typeIds consistently. Your changes have to be compatible to previous versions of the box.
/// [Hive doc](https://docs.hivedb.dev/#/custom-objects/type_adapters)
abstract class HiveTypeId {

}

/// From flutter_hive
Future _initFlutter([String? subDir]) async {
  if (!kIsWeb) {
    var libDir = Platform.isIOS
        ? await getLibraryDirectory()
        : await getApplicationSupportDirectory();
    var path = libDir.path;
    await checkIsOldDbExists();
    if (subDir != null) {
      path = path_helper.join(path, subDir);
    }
    Hive.init(path);
  }
}

Future<void> checkIsOldDbExists() async {
  var docDir = await getApplicationDocumentsDirectory();
  Directory(docDir.path).list().forEach((element) async {
    if (element.path.contains(".hive") || element.path.contains(".lock")) {
      await Directory(element.path).delete(recursive: true);
    }
  });
}
