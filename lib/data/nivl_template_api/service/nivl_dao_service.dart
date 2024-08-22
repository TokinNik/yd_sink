import 'package:template_app/data/core/local/drift.dart';

class NivlDaoService {
  late final Drift _drift;

  NivlDaoService(this._drift);

  Future<void> add(NIVLDtoCompanion data) async {
    await _drift.into(_drift.nIVLDto).insertOnConflictUpdate(data);
  }

  Future<void> addAll(List<NIVLDtoCompanion> data) async {
    await _drift.batch((batch) {
      batch.insertAllOnConflictUpdate(_drift.nIVLDto, data);
    });
  }

  Future<List<NIVLDtoData>> get() async {
    return await _drift.select(_drift.nIVLDto).get();
  }
}
