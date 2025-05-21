import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final withRoute = context.vars['withRoute'] as bool;
  final name = context.vars['name'] as String;
  final stateManager = context.vars['stateManager'] as String;
  final withBloc = stateManager == 'bloc';
  final withCubit = stateManager == 'cubit';
  final withStateManager = withBloc || withCubit;

  context.vars = {
    ...context.vars,
    'withBloc': withBloc,
    'withCubit': withCubit,
    'withStateManager': withStateManager,
  };

  await createRoute(context, withRoute, name);
}

Future<void> createRoute(
    HookContext context, bool withRoute, String name) async {
  if (!withRoute) {
    return context.logger.info('👹👹👹 Ты отказался от магии 👹👹👹');
  }

  context.logger.info('🌟🌟🌟 Добавим немного магии 🌟🌟🌟');

  final file = File('./lib/presentation/app/app_router.dart');

  final String content = await file.readAsString();

  final RegExp regImport = RegExp(r'\npart');
  final RegExp regRoute = RegExp(r',\n      ];');

  final String fileNameSnake = name.snakeCase;
  final String fileNamePascal = name.pascalCase;

  final String lineImport =
      "import '../${fileNameSnake}_screen/${fileNameSnake}_screen.dart';\n\npart";
  final String lineRoute =
      ",\n\t\t\t\tAutoRoute(path: '/${fileNameSnake}', page: ${fileNamePascal}Route.page),\n      ];";

  String updatedContent = content.replaceFirst(regImport, lineImport);
  updatedContent = updatedContent.replaceFirst(regRoute, lineRoute);
  await file.writeAsString(updatedContent);

  context.logger.info('🪄 Пух 🪄 Пух 🪄 Пух');
}
