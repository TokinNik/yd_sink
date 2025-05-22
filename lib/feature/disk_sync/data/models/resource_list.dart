import 'package:json_annotation/json_annotation.dart';

part 'resource_list.g.dart';

enum FolderType { dir, file }

@JsonSerializable()
class ResourceList {
  final String? sort; // (string, optional): <Поле, по которому отсортирован список>,
  final List<Resource>? items; // (Array[Resource]): <Элементы списка>,
  final int? limit; // (integer, optional): <Количество элементов на странице>,
  final int? offset; // (integer, optional): <Смещение от начала списка>,
  final String? path; // (string): <Путь к ресурсу, для которого построен список>,
  final int? total; // (integer, optional): <Общее количество элементов в списке>

  ResourceList(this.sort, this.items, this.limit, this.offset, this.path, this.total);

  factory ResourceList.fromJson(Map<String, dynamic> json) => _$ResourceListFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceListToJson(this);
}

@JsonSerializable()
class Resource {
  @JsonKey(name: 'resource_id')
  final String? resourceId; // (string, optional): <Идентификатор ресурса>,
  final String? file; // (string, optional): <URL для скачивания файла>,
  @JsonKey(name: '_embedded')
  final ResourceList? embedded; // (ResourceList, optional),
  final String? preview; // (string, optional): <URL превью файла>,
  final String? path; // (string): <Путь к ресурсу>,
  final String? name; // (string): <Имя>,
  final DateTime? created; // (string): <Дата создания>,
  final DateTime? modified; // (string): <Дата изменения>,
  final FolderType? type; // (string): <Тип>,

  Resource(
    this.resourceId,
    this.file,
    this.embedded,
    this.preview,
    this.path,
    this.name,
    this.created,
    this.modified,
    this.type,
  );

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
