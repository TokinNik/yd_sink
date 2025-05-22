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

  FolderItem({
    required this.id,
    required this.name,
    required this.path,
    required this.previewUrl,
    required this.downloadUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
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
}
