import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template_app/data/main_api/models/remote/route_request.dart';
import 'package:template_app/data/main_api/models/remote/route_response.dart';

import '../../core/core.dart';

part 'main_api_service.g.dart';

@RestApi()
abstract class MainApiService {
  factory MainApiService(Dio dio, {String baseUrl}) = _MainApiService;

  @POST("routes/list")
  Future<RouteResponse> routes(@Body() RouteRequest body);
}
