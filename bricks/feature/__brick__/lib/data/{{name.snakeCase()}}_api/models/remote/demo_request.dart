import 'package:json_annotation/json_annotation.dart';

part 'demo_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DemoRequest {

  DemoRequest();

  factory DemoRequest.fromJson(Map<String, dynamic> json) => _$DemoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DemoRequestToJson(this);
}

