import 'dart:async';
import 'package:async/async.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/widgets.dart';

/// Базовый класс состояния контролеров
/// Обеспечивает доступ к контролерам, груповым проверкам, инициализации и освобождению контролеров
abstract class FormicState {
  List<FormicController> fields();

  bool get hasError => fields().find((field) => field.hasError == true) != null;

  void dispose() {
    for (var field in fields()) {
      field.dispose();
    }
  }
}

/// Класс валидации
///
/// Содержит сообщение ошибки [message] и функцию проверки [onCheck]
///
/// Функция [onCheck] должна совершать положительную проверку, может быть асинхронной
/// т.е. значение: является строкой, имеет сигнатуру имел, содержит нужный символ и т.д.
class ValidatorItem {
  String message;
  FutureOr<bool> Function(String) onCheck;

  ValidatorItem({required this.message, required this.onCheck});
}

/// Класс контроллер
///
/// Отслеживает состояние поля, хранит ошибки, выполняет валидацю используя [ValidatorItem]
abstract class FormicController {
  final _controller = TextEditingController();
  late List<String> _errors = [];

  bool _inValidating = false;
  CancelableOperation? _cancelableOperation;

  FormicController() {
    _controller.addListener(() => _onCanceledValidator(_controller.text));
  }

  void dispose() {
    _controller.removeListener(() => _onCanceledValidator(_controller.text));
    _controller.dispose();
  }

  /// Флаг в процессе валидации
  bool get inValidating => _inValidating;

  /// Флаг имеет ошибку
  bool get hasError => _errors.isNotEmpty;

  /// Текущие значение поля
  String get value => _controller.text;

  /// Контроллеро поля
  TextEditingController get controller => _controller;

  /// Список ошибок
  List<String> get errors => _errors;

  /// Перезапуск асинхронных проверок
  void _onCanceledValidator(String value) {
    _cancelableOperation?.cancel();
    _cancelableOperation = CancelableOperation.fromFuture(_onValidator(value));
    _cancelableOperation?.valueOrCancellation();
  }

  /// Валидация поля
  Future<void> _onValidator(String value) async {
    List<String> newErrors = [];
    _inValidating = true;

    for (var validator in validators()) {
      var isValid = await validator.onCheck(value);
      if (!isValid) newErrors.add(validator.message);
    }

    _errors = newErrors;
    _inValidating = false;
  }

  /// Список валидаторов для проверки поля
  ///
  /// Будут выполнятся в веденном порядке, могут быть асинхронными
  List<ValidatorItem> validators();
}
