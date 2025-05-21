import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:YDsync/environment/environments.dart';

import '../models/token_dto.dart';

class AuthDaoService {
  static const String _storageKey = 'token_key';

  const AuthDaoService();

  Future<TokenDto?> getToken() async {
    final instance = await _shared;

    final tokenStr = instance.getString(_storageKey);

    if (tokenStr == null) {
      return null;
    }

    final tokenJson = jsonDecode(tokenStr);
    if (tokenJson is! Map<String, dynamic>) {
      return null;
    }

    try {
      return TokenDto.fromJson(tokenJson);
    } catch (e, s) {
      Environment.recordError(e, s);

      return null;
    }
  }

  Future<void> setToken(TokenDto data) async {
    final tokenJson = data.toJson();
    final tokenStr = jsonEncode(tokenJson);

    (await _shared).setString(_storageKey, tokenStr);
  }

  Future<void> removeToken() async {
    (await _shared).remove(_storageKey);
  }

  Future<SharedPreferences> get _shared async => SharedPreferences.getInstance();
}
