import 'package:template_app/data/main_api/mapper/route_mapper.dart';
import 'package:template_app/data/main_api/models/remote/route_request.dart';
import 'package:template_app/data/main_api/service/main_api_service.dart';
import 'package:template_app/domain/models/route_model.dart';

class MainApiRepository {
  final MainApiService _serviceApi;

  MainApiRepository(this._serviceApi);

  Future<List<RouteModel>> routes() async {
    var response = await _serviceApi.routes(RouteRequest());
    return response.toModel;
  }
}
