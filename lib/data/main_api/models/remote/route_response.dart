import 'package:json_annotation/json_annotation.dart';

part 'route_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RouteResponse {
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'items')
  List<RouteItemResponse> items;

  RouteResponse({required this.count, required this.items});

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RouteResponseToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class RouteItemResponse {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'createdAt')
  String createdAt;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'cityId')
  String cityId;
  @JsonKey(name: 'categoryId')
  String categoryId;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'durationTime')
  int durationTime;
  @JsonKey(name: 'durationDistance')
  int durationDistance;
  @JsonKey(name: 'price')
  int price;

  RouteItemResponse(
      {required this.id,
      required this.createdAt,
      required this.status,
      required this.name,
      required this.cityId,
      required this.categoryId,
      required this.description,
      required this.durationTime,
      required this.durationDistance,
      required this.price});

  factory RouteItemResponse.fromJson(Map<String, dynamic> json) => _$RouteItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RouteItemResponseToJson(this);
}
