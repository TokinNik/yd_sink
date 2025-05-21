import 'package:YDsync/feature/auth/data/models/token_dto.dart';
import 'package:YDsync/feature/auth/data/models/token_response.dart';
import 'package:YDsync/feature/auth/models/token_model.dart';

extension TokenModelMapper on TokenModel {
  TokenDto get toDto => TokenDto(accessToken: accessToken, refreshToken: refreshToken);
}

extension TokenDtoMapper on TokenDto {
  TokenModel get toModel => TokenModel(accessToken, refreshToken);
}

extension TokenResponseMapper on TokenResponse {
  TokenModel get toModel => TokenModel(accessToken, refreshToken);

  TokenDto get toDto => TokenDto(accessToken: accessToken, refreshToken: refreshToken);
}
