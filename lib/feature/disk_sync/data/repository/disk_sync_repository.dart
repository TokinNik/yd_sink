import 'dart:io';

import 'package:YDsync/feature/disk_sync/domain/models/folder.dart';
import 'package:media_store_plus/media_store_platform_interface.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../service/disk_sync_service.dart';

class DiskSyncRepository {
  final DiskSyncService _service;

  DiskSyncRepository(this._service);

  Future<List<FolderItem>> getFiles(String folder, {int? limit = 40, int? offset = 0}) async {
    final result = await _service.getFolder(folder: folder, limit: limit, offset: offset);

    return result.embedded?.items?.map((e) => FolderItem.fromDto(e)).toList() ?? [];
  }

  Future<bool> downloadFile(FolderItem e) async {
    if (e.downloadUrl == null) return false;

    final Directory? saveDir;

    if (Platform.isAndroid) {
      saveDir = await getExternalStorageDirectory();
    } else {
      saveDir = await getApplicationDocumentsDirectory();
    }
    final tempFilePath = '${saveDir!.path}/${e.name}';

    print('!!!DEBUG: DiskSyncRepository:downloadFile: $tempFilePath');

    await _service.downloadFile(fileUrl: e.downloadUrl!, filePath: tempFilePath);

    var info = await MediaStorePlatform.instance.saveFile(
      tempFilePath: tempFilePath,
      fileName: e.name ?? 'temp_no_name_error_file',
      dirType: DirType.audio,
      dirName: DirName.music,
      relativePath: e.noDiskPathNoName,
    );

    print('!!!DEBUG: DiskSyncRepository:downloadFile: $info');

    final tempFile = File(tempFilePath);

    print('!!!DEBUG: DiskSyncRepository:downloadFile: tempFile.existsSync =  ${tempFile.existsSync()}');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }
    return true;
  }
}
