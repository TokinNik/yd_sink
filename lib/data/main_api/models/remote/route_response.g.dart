// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) =>
    RouteResponse(
      count: (json['count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => RouteItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteResponseToJson(RouteResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

RouteItemResponse _$RouteItemResponseFromJson(Map<String, dynamic> json) =>
    RouteItemResponse(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      status: json['status'] as String,
      name: json['name'] as String,
      cityId: json['cityId'] as String,
      categoryId: json['categoryId'] as String,
      description: json['description'] as String,
      durationTime: (json['durationTime'] as num).toInt(),
      durationDistance: (json['durationDistance'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$RouteItemResponseToJson(RouteItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'name': instance.name,
      'cityId': instance.cityId,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'durationTime': instance.durationTime,
      'durationDistance': instance.durationDistance,
      'price': instance.price,
    };
