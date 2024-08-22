// Email
import 'formic.dart';

class EmailInput extends FormicController {
  static final _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  List<ValidatorItem> validators() => [
        ValidatorItem(
            message: "This field must be filled",
            onCheck: (value) => value.isNotEmpty),
        ValidatorItem(
            message: "This is not valid email",
            onCheck: (value) => _emailRegExp.hasMatch(value)),
      ];
}
