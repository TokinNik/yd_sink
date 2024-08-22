import 'package:template_app/data/{{name.snakeCase()}}_api/mapper/demo_mapper.dart';
import 'package:template_app/data/{{name.snakeCase()}}_api/models/remote/demo_request.dart';
import 'package:template_app/data/{{name.snakeCase()}}_api/models/remote/demo_response.dart';
import 'package:template_app/data/{{name.snakeCase()}}_api/service/{{name.snakeCase()}}_api_service.dart';
import 'package:template_app/data/{{name.snakeCase()}}_api/service/{{name.snakeCase()}}_dao_service.dart';
import 'package:template_app/domain/models/demo_model.dart';

class {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Service _removeService;
  {{#withDatabase}}final {{name.pascalCase()}}DaoService _localService;{{/withDatabase}}

  {{name.pascalCase()}}Repository(
      this._removeService,
      {{#withDatabase}}this._localService{{/withDatabase}}
  );

  Future<DemoModel> demo() async {
    var response = await _removeService.demo(DemoRequest());
    {{#withDatabase}}_localService.setDemo(response.toDto);{{/withDatabase}}
    return response.toModel;
  }
}
