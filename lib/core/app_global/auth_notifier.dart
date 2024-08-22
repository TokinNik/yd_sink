import 'package:flutter/foundation.dart';

enum AuthState { NO_AUTH, AUTH, WAIT_CHECK }

class AuthStateNotificator extends ValueNotifier<AuthState> {
  AuthStateNotificator(super.value);
}

AuthStateNotificator authStateNotificator =
    AuthStateNotificator(AuthState.WAIT_CHECK);
