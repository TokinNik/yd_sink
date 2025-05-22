// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceList _$ResourceListFromJson(Map<String, dynamic> json) => ResourceList(
  json['sort'] as String?,
  (json['items'] as List<dynamic>?)
      ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['limit'] as num?)?.toInt(),
  (json['offset'] as num?)?.toInt(),
  json['path'] as String?,
  (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResourceListToJson(ResourceList instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'items': instance.items,
      'limit': instance.limit,
      'offset': instance.offset,
      'path': instance.path,
      'total': instance.total,
    };

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
  json['resource_id'] as String?,
  json['file'] as String?,
  json['_embedded'] == null
      ? null
      : ResourceList.fromJson(json['_embedded'] as Map<String, dynamic>),
  json['preview'] as String?,
  json['path'] as String?,
  json['name'] as String?,
  json['created'] == null ? null : DateTime.parse(json['created'] as String),
  json['modified'] == null ? null : DateTime.parse(json['modified'] as String),
  $enumDecodeNullable(_$FolderTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
  'resource_id': instance.resourceId,
  'file': instance.file,
  '_embedded': instance.embedded,
  'preview': instance.preview,
  'path': instance.path,
  'name': instance.name,
  'created': instance.created?.toIso8601String(),
  'modified': instance.modified?.toIso8601String(),
  'type': _$FolderTypeEnumMap[instance.type],
};

const _$FolderTypeEnumMap = {FolderType.dir: 'dir', FolderType.file: 'file'};
