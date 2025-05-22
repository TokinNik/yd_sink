import 'package:YDsync/feature/disk_sync/domain/models/folder.dart';

import '../service/disk_sync_service.dart';

class DiskSyncRepository {
  final DiskSyncService _service;

  DiskSyncRepository(this._service);

  Future<List<FolderItem>> getFiles(String folder, {int? limit = 40, int? offset = 0}) async {
    final result = await _service.getFolder(folder: folder, limit: limit, offset: offset);

    return result.embedded?.items?.map((e) => FolderItem.fromDto(e)).toList() ?? [];
  }
}
