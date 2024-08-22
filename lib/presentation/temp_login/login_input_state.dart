import 'package:template_app/utils/formic/formic.dart';
import '../../utils/formic/email_contoller.dart';
import '../../utils/formic/password_controller.dart';

// State
class LoginInputsState extends FormicState {
  final EmailInput emailInput = EmailInput();
  final PasswordInput passwordInput = PasswordInput();

  @override
  List<FormicController> fields() => [emailInput, passwordInput];
}
