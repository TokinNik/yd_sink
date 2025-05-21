// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_search_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasaMediaSearchResponse _$NasaMediaSearchResponseFromJson(Map<String, dynamic> json) =>
    NasaMediaSearchResponse(NasaSearchImageItems.fromJson(json['collection'] as Map<String, dynamic>));

Map<String, dynamic> _$NasaMediaSearchResponseToJson(NasaMediaSearchResponse instance) => <String, dynamic>{
  'collection': instance.collection,
};

NasaSearchImageItems _$NasaSearchImageItemsFromJson(Map<String, dynamic> json) => NasaSearchImageItems(
  (json['items'] as List<dynamic>).map((e) => NasaSearchImageItem.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$NasaSearchImageItemsToJson(NasaSearchImageItems instance) => <String, dynamic>{
  'items': instance.items,
};

NasaSearchImageItem _$NasaSearchImageItemFromJson(Map<String, dynamic> json) => NasaSearchImageItem(
  json['href'] as String?,
  (json['data'] as List<dynamic>?)?.map((e) => NasaMediaData.fromJson(e as Map<String, dynamic>)).toList(),
  (json['links'] as List<dynamic>?)?.map((e) => NasaMediaLink.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$NasaSearchImageItemToJson(NasaSearchImageItem instance) => <String, dynamic>{
  'href': instance.href,
  'data': instance.data,
  'links': instance.links,
};

NasaMediaData _$NasaMediaDataFromJson(Map<String, dynamic> json) => NasaMediaData(
  json['type'] as String?,
  json['title'] as String?,
  json['subTitle'] as String?,
  json['date'] as String?,
  json['nasa_id'] as String?,
  json['center'] as String?,
  json['mediaLink'] as String?,
  (json['keyWord'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$NasaMediaDataToJson(NasaMediaData instance) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'subTitle': instance.subTitle,
  'date': instance.date,
  'nasa_id': instance.nasaId,
  'center': instance.center,
  'mediaLink': instance.mediaLink,
  'keyWord': instance.keyWord,
};

NasaMediaLink _$NasaMediaLinkFromJson(Map<String, dynamic> json) => NasaMediaLink(json['href'] as String?);

Map<String, dynamic> _$NasaMediaLinkToJson(NasaMediaLink instance) => <String, dynamic>{'href': instance.href};
