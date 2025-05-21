import 'package:flutter/foundation.dart';

enum AuthState { noAuth, auth, waitCheck }

class AuthStateNotificator extends ValueNotifier<AuthState> {
  AuthStateNotificator(super.value);
}

AuthStateNotificator authStateNotificator = AuthStateNotificator(AuthState.waitCheck);
