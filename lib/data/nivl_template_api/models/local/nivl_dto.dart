import 'dart:convert';
import 'package:drift/drift.dart';

class NIVLDto extends Table {
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

class StringListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(json.decode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
