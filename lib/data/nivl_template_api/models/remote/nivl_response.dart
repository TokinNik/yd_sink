import 'package:json_annotation/json_annotation.dart';

part 'nivl_response.g.dart';

@JsonSerializable()
class NIVLResponse {
  final _Collection collection;

  NIVLResponse(this.collection);

  factory NIVLResponse.fromJson(Map<String, dynamic> json) =>
      _$NIVLResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NIVLResponseToJson(this);
}

@JsonSerializable()
class _Collection {
  final List<_Item> items;

  _Collection(this.items);

  factory _Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class _Item {
  final String? href;
  final List<_Data>? data;

  _Item(
    this.href,
    this.data,
  );

  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class _Data {
  final String? type;
  final String? title;
  final String? subTitle;
  final String? image;
  final String? date;
  @JsonKey(name: "nasa_id")
  final String? nasaId;
  final String? center;
  final String? mediaLink;
  final List<String>? keyWord;

  _Data(
    this.type,
    this.title,
    this.subTitle,
    this.image,
    this.date,
    this.nasaId,
    this.center,
    this.mediaLink,
    this.keyWord,
  );

  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
