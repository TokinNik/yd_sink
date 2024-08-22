import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_app/core/core.dart';

Future<T?> showErrorDialog<T>({
  required BuildContext? context,
  required String title,
  String? message,
  String? buttonText,
  Function()? onCancel,
  bool barrierDismissible = true,
  Object? exception,
  StackTrace? stackTrace,
}) {
  if (context == null) return Future.value(null);
  return showDialog<T>(
    context: context,
    builder: (context) => ErrorDialog(
      title: title,
      message: message,
      onCancel: onCancel,
      buttonText: buttonText,
      exception: exception,
      stackTrace: stackTrace,
    ),
    barrierDismissible: barrierDismissible,
  );
}

class ErrorDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String? buttonText;
  final Function()? onCancel;
  final Object? exception;
  final StackTrace? stackTrace;

  const ErrorDialog({
    super.key,
    required this.title,
    this.message,
    this.buttonText,
    this.onCancel,
    this.exception,
    this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: GestureDetector(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: message ?? exception.toString()));
        },
        child: Text(title),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            message == null ? const SizedBox.shrink() : Text(message ?? ""),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
