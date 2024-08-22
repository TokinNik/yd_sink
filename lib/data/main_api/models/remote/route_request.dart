import 'package:json_annotation/json_annotation.dart'; 

part 'route_request.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RouteRequest {

  RouteRequest();

   factory RouteRequest.fromJson(Map<String, dynamic> json) => _$RouteRequestFromJson(json);

   Map<String, dynamic> toJson() => _$RouteRequestToJson(this);
}

