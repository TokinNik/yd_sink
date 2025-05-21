import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:YDsync/feature/nasa_media/data/models/remote/nasa_search_image_response.dart';

part 'nasa_service.g.dart';

@RestApi()
abstract class NasaService {
  factory NasaService(Dio dio, {String baseUrl}) = _NasaService;

  @GET('https://images-api.nasa.gov/search')
  Future<NasaMediaSearchResponse> search(
    @Query("q") String query,
    @Query("media_type") String mediaType,
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
  );
}
