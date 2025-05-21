import 'package:drift/drift.dart';
import 'package:YDsync/core/utils/converters/string_list_converter.dart';

class NasaMediaTable extends Table {
  TextColumn get id => text()();

  TextColumn get type => text()();

  TextColumn get title => text()();

  TextColumn get subTitle => text()();

  TextColumn get image => text()();

  TextColumn get date => text()();

  TextColumn get center => text()();

  TextColumn get mediaLink => text()();

  TextColumn get keyWord => text().map(StringListTypeConverter())();

  @override
  Set<Column> get primaryKey => {id};
}
