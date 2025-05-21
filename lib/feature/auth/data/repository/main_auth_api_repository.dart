import 'package:YDsync/feature/auth/data/mapper/token_mapper.dart';

import '../../models/token_model.dart';
import '../models/login_request.dart';
import '../models/refresh_request.dart';
import '../models/register_request.dart';
import '../service/auth_service.dart';
import '../service/main_auth_dao_service.dart';

class AuthRepository {
  final AuthService _serviceApi;
  final AuthDaoService _serviceDao;

  TokenModel? token;

  AuthRepository(this._serviceApi, this._serviceDao);

  Future<void> init() async {
    var tokenDto = await _serviceDao.getToken();
    token = tokenDto?.toModel;
  }

  Future<void> login(LoginRequest request) async {
    var response = await _serviceApi.login(request);
    token = response.toModel;
    _serviceDao.setToken(response.toDto);
  }

  Future<void> register(RegisterRequest request) async {
    var response = await _serviceApi.register(request);
    token = response.toModel;
    _serviceDao.setToken(response.toDto);
  }

  Future<void> refresh(RefreshRequest request) async {
    var response = await _serviceApi.refresh(request);
    token = response.toModel;
    _serviceDao.setToken(response.toDto);
  }

  Future<void> logout() async {
    token = null;
    _serviceDao.removeToken();
  }
}
