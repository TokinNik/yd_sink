import 'package:template_app/data/main_api/mapper/token_mapper.dart';

import '../../../domain/models/token_model.dart';
import '../models/remote/login_request.dart';
import '../models/remote/refresh_request.dart';
import '../models/remote/register_request.dart';
import '../service/main_auth_api_service.dart';
import '../service/main_auth_dao_service.dart';

class MainAuthApiRepository {
  final MainAuthApiService _serviceApi;
  final MainAuthDaoService _serviceDao;

  TokenModel? token;

  MainAuthApiRepository(this._serviceApi, this._serviceDao);

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
