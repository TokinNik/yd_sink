import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/remote/login_request.dart';
import '../models/remote/refresh_request.dart';
import '../models/remote/register_request.dart';
import '../models/remote/token_response.dart';

part 'main_auth_api_service.g.dart';

@RestApi()
abstract class MainAuthApiService {
  factory MainAuthApiService(Dio dio, {String baseUrl}) = _MainAuthApiService;

  @POST("auth/authentication")
  Future<TokenResponse> login(@Body() LoginRequest body);

  @POST("auth/registration")
  Future<TokenResponse> register(@Body() RegisterRequest body);

  @POST("auth/refresh")
  Future<TokenResponse> refresh(@Body() RefreshRequest body);
}