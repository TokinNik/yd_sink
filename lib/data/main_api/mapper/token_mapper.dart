import 'package:template_app/data/main_api/models/local/token_dto.dart';
import 'package:template_app/data/main_api/models/remote/token_response.dart';
import 'package:template_app/domain/models/token_model.dart';

extension TokenModelMapper on TokenModel {
  TokenDto get toDto => TokenDto()
    ..id = 0
    ..accessToken = accessToken
    ..refreshToken = refreshToken;
}

extension TokenDtoMapper on TokenDto {
  TokenModel get toModel => TokenModel(accessToken, refreshToken);
}

extension TokenResponseMapper on TokenResponse {
  TokenModel get toModel => TokenModel(accessToken, refreshToken);

  TokenDto get toDto => TokenDto()
    ..id = 0
    ..accessToken = accessToken
    ..refreshToken = refreshToken;
}
