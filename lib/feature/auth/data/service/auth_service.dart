import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/login_request.dart';
import '../models/refresh_request.dart';
import '../models/register_request.dart';
import '../models/token_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("auth/authentication")
  Future<TokenResponse> login(@Body() LoginRequest body);

  @POST("auth/registration")
  Future<TokenResponse> register(@Body() RegisterRequest body);

  @POST("auth/refresh")
  Future<TokenResponse> refresh(@Body() RefreshRequest body);
}
