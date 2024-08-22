import 'package:json_annotation/json_annotation.dart';

part 'demo_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DemoResponse {

  DemoResponse();

  factory DemoResponse.fromJson(Map<String, dynamic> json) => _$DemoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DemoResponseToJson(this);
}

