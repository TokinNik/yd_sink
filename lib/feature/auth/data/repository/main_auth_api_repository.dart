import 'package:YDsync/feature/auth/data/mapper/token_mapper.dart';
import 'package:YDsync/feature/auth/data/models/token_dto.dart';
import 'package:flutter_login_yandex/flutter_login_yandex.dart';

import '../../models/token_model.dart';
import '../service/main_auth_dao_service.dart';

class AuthRepository {
  final AuthDaoService _serviceDao;

  TokenModel? token;

  AuthRepository(this._serviceDao);

  Future<void> init() async {
    var tokenDto = await _serviceDao.getToken();
    token = tokenDto?.toModel;
  }

  Future<void> login() async {
    final yandexLogin = FlutterLoginYandex();
    final result = await yandexLogin.signIn();
    final tokenDTO = TokenDto(accessToken: result?['token'] as String, refreshToken: '');
    token = tokenDTO.toModel;
    _serviceDao.setToken(tokenDTO);
  }

  Future<void> refresh() async {
   // TODO(tnr): or delete
  }

  Future<void> logout() async {
    token = null;
    _serviceDao.removeToken();
  }
}
