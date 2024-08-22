{{#withIsar}}import '../models/{{#withDatabase}}local{{/withDatabase}}/demo_dto.dart';{{/withIsar}}
{{#withDrift}}import 'package:template_app/data/core/local/drift.dart';{{/withDrift}}
{{#withDrift}}import 'package:drift/drift.dart';{{/withDrift}}
import '../models/remote/demo_response.dart';
import 'package:template_app/domain/models/demo_model.dart';

extension DemoResponseMapper on DemoResponse {
  {{#withIsar}}DemoDto get toDto => DemoDto()..id = 0;{{/withIsar}}
  {{#withDrift}}DemoDtoCompanion get toDto => DemoDtoCompanion.insert(id: const Value(0));{{/withDrift}}
  DemoModel get toModel => DemoModel();
}

extension DemoDtoMapper on DemoDtoData {
  DemoResponse get toResponse => DemoResponse();
  DemoModel get toModel => DemoModel();
}
