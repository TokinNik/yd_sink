import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress =
      context.logger.progress('И щепотку кодегена 🧂🧂🧂');
  await Process.run('dart', ['run', 'build_runner', 'build']);
  progress.complete();

  context.logger.info('Тада 🎉🎉🎉');
}
