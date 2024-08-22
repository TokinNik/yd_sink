{{#withIsar}}import 'package:isar/isar.dart';

part 'demo_dto.g.dart';

@collection
class DemoDto {
  late Id id;
}{{/withIsar}}
{{#withDrift}}import 'package:drift/drift.dart';

class DemoDto extends Table {
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}{{/withDrift}}