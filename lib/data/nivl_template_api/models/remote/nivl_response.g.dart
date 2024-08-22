// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nivl_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NIVLResponse _$NIVLResponseFromJson(Map<String, dynamic> json) => NIVLResponse(
      _Collection.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NIVLResponseToJson(NIVLResponse instance) =>
    <String, dynamic>{
      'collection': instance.collection,
    };

_Collection _$CollectionFromJson(Map<String, dynamic> json) => _Collection(
      (json['items'] as List<dynamic>)
          .map((e) => _Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionToJson(_Collection instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
      json['href'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => _Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
      'href': instance.href,
      'data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      json['type'] as String?,
      json['title'] as String?,
      json['subTitle'] as String?,
      json['image'] as String?,
      json['date'] as String?,
      json['nasa_id'] as String?,
      json['center'] as String?,
      json['mediaLink'] as String?,
      (json['keyWord'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'image': instance.image,
      'date': instance.date,
      'nasa_id': instance.nasaId,
      'center': instance.center,
      'mediaLink': instance.mediaLink,
      'keyWord': instance.keyWord,
    };
