import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:YDsync/data/{{name.snakeCase()}}_api/models/remote/demo_request.dart';
import 'package:YDsync/data/{{name.snakeCase()}}_api/models/remote/demo_response.dart';

import '../../core/core.dart';

part '{{name.snakeCase()}}_api_service.g.dart';

@RestApi()
abstract class {{name.pascalCase()}}Service {
  factory {{name.pascalCase()}}Service(Dio dio, {String baseUrl}) = _{{name.pascalCase()}}Service;

  @POST("demo")
  Future<DemoResponse> demo(@Body() DemoRequest body);
}
