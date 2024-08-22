import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template_app/data/core/network/dio_utils/dio_extensions.dart';
import 'package:template_app/data/nivl_template_api/models/remote/nivl_response.dart';

part 'nivl_service.g.dart';

@RestApi()
abstract class NIVLService {

  @GET('https://images-api.nasa.gov/search')
  Future<NIVLResponse> nivlSearch(
    @Query("q") String query,
    @Query("media_type") String mediaType,
  );
}

class NIVLServiceImpl with DioErrorUnwrapper implements NIVLService {
  _NIVLService service;

  NIVLServiceImpl(Dio dio) : service = _NIVLService(dio);

  @override
  Future<NIVLResponse> nivlSearch(query, mediaType) =>
      run(service.nivlSearch(query, mediaType));
}
