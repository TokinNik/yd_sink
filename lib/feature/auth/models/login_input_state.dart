import 'package:YDsync/core/utils/formic/formic.dart';

import '../../../core/utils/formic/email_contoller.dart';
import '../../../core/utils/formic/password_controller.dart';

// State
class LoginInputsState extends FormicState {
  final EmailInput emailInput = EmailInput();
  final PasswordInput passwordInput = PasswordInput();

  @override
  List<FormicController> fields() => [emailInput, passwordInput];
}
