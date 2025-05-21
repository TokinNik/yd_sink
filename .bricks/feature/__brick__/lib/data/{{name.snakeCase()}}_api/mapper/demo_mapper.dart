{{#withDrift}}import 'package:YDsync/data/core/local/drift.dart';{{/withDrift}}
{{#withDrift}}import 'package:drift/drift.dart';{{/withDrift}}
import '../models/remote/demo_response.dart';
import 'package:YDsync/domain/models/demo_model.dart';

extension DemoResponseMapper on DemoResponse {
  {{#withDrift}}DemoDtoCompanion get toDto => DemoDtoCompanion.insert(id: const Value(0));{{/withDrift}}
  DemoModel get toModel => DemoModel();
}

extension DemoDtoMapper on DemoDtoData {
  DemoResponse get toResponse => DemoResponse();
  DemoModel get toModel => DemoModel();
}
