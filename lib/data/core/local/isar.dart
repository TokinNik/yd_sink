import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:template_app/data/main_api/models/local/token_dto.dart';

abstract class IsarConfig {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.openSync(
      [TokenDtoSchema],
      directory: dir.path,
    );
  }
}
