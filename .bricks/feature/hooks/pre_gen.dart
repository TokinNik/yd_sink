import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final name = context.vars['name'] as String;
  final database = context.vars['database'] as String;
  final withDrift = database == 'drift';
  final withDatabase = withDrift;

  context.vars = {
    ...context.vars,
    'withDrift': withDrift,
    'withDatabase': withDatabase,
  };

  await updateDrift(context, withDrift, name);
  await updateDI(context, withDatabase, name);
}

Future<void> updateDrift(
    HookContext context, bool withDrift, String name) async {
  if (!withDrift) {
    return context.logger.info('👹👹👹 Ты отказался от магии 👹👹👹');
  }

  context.logger.info('🌟🌟🌟 Добавим немного магии 🌟🌟🌟');

  final file = File('./lib/data/core/local/drift.dart');

  final String content = await file.readAsString();

  final RegExp regImport = RegExp(r'\npart');
  final RegExp regEndScheme = RegExp(r'\]\)');

  final String fileNameSnake = name.snakeCase;

  final String lineImport =
      "import '../../${fileNameSnake}_api/models/local/demo_dto.dart';\n\npart";
  final String lineEndScheme = ", DemoDto])";

  String updatedContent = content.replaceFirst(regImport, lineImport);
  updatedContent = updatedContent.replaceFirst(regEndScheme, lineEndScheme);
  await file.writeAsString(updatedContent);

  context.logger.info('🪄 Пух 🪄 Пух 🪄 Пух');
}

Future<void> updateDI(
    HookContext context, bool withDatabase, String name) async {
  context.logger.info('🌟🌟🌟 Добавим немного магии 🌟🌟🌟');

  final file = File('./lib/di/modules/data_module.dart');

  final String content = await file.readAsString();

  final RegExp regRegisterModule = RegExp(r'\);\n}');
  final RegExp regImport = RegExp(r';\n\n');

  final String fileNamePascal = name.pascalCase;
  final String fileNameSnake = name.snakeCase;

  // update register
  final String lineRegisterModule =
      "\);\n  _register${fileNamePascal}(container);\n}";

  // update import
  String lineImport = """;\n
import 'package:YDsync/data/${fileNameSnake}_api/repository/${fileNameSnake}_api_repository.dart';
import 'package:YDsync/data/${fileNameSnake}_api/service/${fileNameSnake}_api_service.dart';
""";
  if (withDatabase) {
    lineImport +=
        "import 'package:YDsync/data/${fileNameSnake}_api/service/${fileNameSnake}_dao_service.dart';\n\n";
  }

  // add module
  final String lineModule = withDatabase
      ? """
void _register${fileNamePascal}(GetIt container) {
  container.registerLazySingleton<${fileNamePascal}DaoService>(
    () => ${fileNamePascal}DaoService(container.get()),
  );

  container.registerLazySingleton<${fileNamePascal}Service>(
    () => ${fileNamePascal}Service(container.get()),
  );

  container.registerLazySingleton<${fileNamePascal}Repository>(
    () => ${fileNamePascal}Repository(container.get(), container.get()),
  );
}
  """
      : """
void _register${fileNamePascal}(GetIt container) {
  container.registerLazySingleton<${fileNamePascal}Service>(
    () => ${fileNamePascal}Service(container.get()),
  );
  
  container.registerLazySingleton<${fileNamePascal}Repository>(
    () => ${fileNamePascal}Repository(container.get()),
  );
}
  """;

  String updatedContent =
      content.replaceFirst(regRegisterModule, lineRegisterModule);
  updatedContent = updatedContent.replaceFirst(regImport, lineImport);
  updatedContent += lineModule;
  await file.writeAsString(updatedContent);

  context.logger.info('🪄 Пух 🪄 Пух 🪄 Пух');
}
