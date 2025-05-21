import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:YDsync/feature/auth/data/models/route_request.dart';
import 'package:YDsync/feature/auth/data/models/route_response.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST("routes/list")
  Future<RouteResponse> routes(@Body() RouteRequest body);
}
