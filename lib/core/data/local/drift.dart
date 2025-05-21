import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:YDsync/core/utils/converters/string_list_converter.dart';

import '../../../feature/nasa_media/data/models/local/nasa_media_table.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [NasaMediaTable])
class Drift extends _$Drift {
  Drift() : super(_openConnection());

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'drift.sqlite'));

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      sqlite3.tempDirectory = (await getTemporaryDirectory()).path;

      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  int get schemaVersion => 2;
}
