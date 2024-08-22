import 'package:isar/isar.dart';

import '../models/local/token_dto.dart';

class MainAuthDaoService {
  late final Isar _isar;

  MainAuthDaoService(this._isar);

  Future<TokenDto?> getToken() async {
    return await _isar.tokenDtos.get(0);
  }

  Future<int> setToken(TokenDto data) async {
    return _isar.writeTxn(() async {
      return await _isar.tokenDtos.put(data);
    });
  }

  Future<void> removeToken() async {
    return _isar.writeTxn(() async {
      return await _isar.tokenDtos.clear();
    });
  }
}
