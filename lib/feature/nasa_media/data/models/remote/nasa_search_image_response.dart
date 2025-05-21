import 'package:json_annotation/json_annotation.dart';

part 'nasa_search_image_response.g.dart';

@JsonSerializable()
class NasaMediaSearchResponse {
  final NasaSearchImageItems collection;

  NasaMediaSearchResponse(this.collection);

  factory NasaMediaSearchResponse.fromJson(Map<String, dynamic> json) => _$NasaMediaSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NasaMediaSearchResponseToJson(this);
}

@JsonSerializable()
class NasaSearchImageItems {
  final List<NasaSearchImageItem> items;

  NasaSearchImageItems(this.items);

  factory NasaSearchImageItems.fromJson(Map<String, dynamic> json) => _$NasaSearchImageItemsFromJson(json);

  Map<String, dynamic> toJson() => _$NasaSearchImageItemsToJson(this);
}

@JsonSerializable()
class NasaSearchImageItem {
  final String? href;
  final List<NasaMediaData>? data;
  final List<NasaMediaLink>? links;

  NasaSearchImageItem(this.href, this.data, this.links);

  factory NasaSearchImageItem.fromJson(Map<String, dynamic> json) => _$NasaSearchImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$NasaSearchImageItemToJson(this);
}

@JsonSerializable()
class NasaMediaData {
  final String? type;
  final String? title;
  final String? subTitle;
  final String? date;
  @JsonKey(name: "nasa_id")
  final String? nasaId;
  final String? center;
  final String? mediaLink;
  final List<String>? keyWord;

  NasaMediaData(
    this.type,
    this.title,
    this.subTitle,
    this.date,
    this.nasaId,
    this.center,
    this.mediaLink,
    this.keyWord,
  );

  factory NasaMediaData.fromJson(Map<String, dynamic> json) => _$NasaMediaDataFromJson(json);

  Map<String, dynamic> toJson() => _$NasaMediaDataToJson(this);
}

@JsonSerializable()
class NasaMediaLink {
  final String? href;

  NasaMediaLink(this.href);

  factory NasaMediaLink.fromJson(Map<String, dynamic> json) => _$NasaMediaLinkFromJson(json);

  Map<String, dynamic> toJson() => _$NasaMediaLinkToJson(this);
}
