import 'package:YDsync/feature/auth/data/models/route_request.dart';
import 'package:YDsync/feature/profile/data/mapper/route_mapper.dart';
import 'package:YDsync/feature/profile/data/service/profile_service.dart';
import 'package:YDsync/feature/profile/models/route_model.dart';

class ProfileRepository {
  final ProfileService _serviceApi;

  ProfileRepository(this._serviceApi);

  Future<List<RouteModel>> routes() async {
    var response = await _serviceApi.routes(RouteRequest());
    return response.toModel;
  }
}
