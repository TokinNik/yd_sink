import 'package:YDsync/core/constants/ui_constants.dart';
import 'package:YDsync/feature/disk_sync/data/models/resource_list.dart';

class FolderItem {
  final String id;
  final String? name;
  final String? path;
  final String? previewUrl;
  final String? downloadUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FolderType? type;

  String get noDiskPath => path?.replaceAll('disk:/', '') ?? '';

  String get noDiskPathNoName => noDiskPath.replaceAll(name ?? '', '');

  FolderItem({
    required this.id,
    this.name,
    this.path,
    this.previewUrl,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  factory FolderItem.fromDto(Resource dto) => FolderItem(
    id: dto.resourceId ?? '',
    name: dto.name,
    path: dto.path,
    previewUrl: dto.preview,
    downloadUrl: dto.file,
    createdAt: dto.created,
    updatedAt: dto.modified,
    type: dto.type,
  );

  @override
  String toString() {
    return 'FolderItem{id: $id, name: $name, path: $path, updatedAt: $updatedAt}';
  }
}
