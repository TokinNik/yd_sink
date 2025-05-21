import 'package:YDsync/core/data/local/drift.dart';

class NasaDaoService {
  late final Drift _drift;

  NasaDaoService(this._drift);

  Future<void> add(NasaMediaTableCompanion data) async {
    await _drift.into(_drift.nasaMediaTable).insertOnConflictUpdate(data);
  }

  Future<void> addAll(List<NasaMediaTableCompanion> data) async {
    await _drift.batch((batch) {
      batch.insertAllOnConflictUpdate(_drift.nasaMediaTable, data);
    });
  }

  Future<List<NasaMediaTableData>> get() async {
    return await _drift.select(_drift.nasaMediaTable).get();
  }
}
