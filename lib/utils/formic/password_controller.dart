// Password
import 'formic.dart';

class PasswordInput extends FormicController {
  static RegExp lengthReg = RegExp(r'^.{8,13}$');
  static RegExp hasNumberReg = RegExp(r'[0-9]+');
  static RegExp hasCapitalReg = RegExp(r'[A-Z]+');
  static RegExp hasSymbolReg = RegExp(r'[^a-zA-Z0-9]+');

  @override
  List<ValidatorItem> validators() => [
        ValidatorItem(
            message: "Поле должно быть заполнено",
            onCheck: (value) => value.isNotEmpty),
        ValidatorItem(
            message: "От 8 до 16 символов",
            onCheck: (value) => lengthReg.hasMatch(value)),
        ValidatorItem(
            message: "Хотя бы одна цифра",
            onCheck: (value) => hasNumberReg.hasMatch(value)),
        ValidatorItem(
            message: "Хотя бы одна прописная буква",
            onCheck: (value) => hasCapitalReg.hasMatch(value)),
        ValidatorItem(
            message: "Хотя бы один спецсимвол",
            onCheck: (value) => hasSymbolReg.hasMatch(value)),
      ];
}
