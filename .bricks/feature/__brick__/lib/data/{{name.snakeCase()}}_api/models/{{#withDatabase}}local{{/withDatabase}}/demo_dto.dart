
part 'demo_dto.g.dart';

{{#withDrift}}import 'package:drift/drift.dart';

class DemoDto extends Table {
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}{{/withDrift}}