import 'package:YDsync/feature/nasa_media/data/mappers/nasa_media_dto_to_model_mapper.dart';
import 'package:YDsync/feature/nasa_media/data/mappers/nasa_media_search_mapper.dart';
import 'package:YDsync/feature/nasa_media/data/service/nasa_dao_service.dart';
import 'package:YDsync/feature/nasa_media/data/service/nasa_service.dart';
import 'package:YDsync/feature/nasa_media/model/nasa_media_search_model.dart';

class NasaRepository {
  final NasaService _nasaService;
  final NasaDaoService _nasaDao;

  static const _refreshTime = 10 * 1000; // 10 seconds
  var _lastRefresh = 0;

  NasaRepository(this._nasaService, this._nasaDao);

  Future<List<NasaMediaSearchModel>> getImages(
    String query,
    String mediaType, {
    bool forceRefresh = false,
    int? page,
    int? pageSize,
  }) async {
    final isCanRefresh = DateTime.now().millisecondsSinceEpoch > (_lastRefresh + _refreshTime);

    var cache = NasaMediaSearchDtoToDbMapper.to(await _nasaDao.get());
    if (cache.isNotEmpty && !forceRefresh && !isCanRefresh) {
      return cache;
    }

    var result = await _nasaService.search(query, mediaType, page, pageSize);
    var data = NasaMediaSearchMapper.call(result);

    _lastRefresh = DateTime.now().millisecondsSinceEpoch;
    await _nasaDao.addAll(NasaMediaSearchDtoToDbMapper.from(data));

    return data;
  }
}
