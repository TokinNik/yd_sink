import 'package:template_app/data/nivl_template_api/mappers/nivl_dto_to_model_mapper.dart';
import 'package:template_app/data/nivl_template_api/mappers/nivl_search_mapper.dart';
import 'package:template_app/data/nivl_template_api/service/nivl_dao_service.dart';
import 'package:template_app/data/nivl_template_api/service/nivl_service.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';

abstract class NIVLRepository {
  Future<List<NIVLDataModel>> getNIVLData(String query, String mediaType,
      {bool forceRefresh = false});
}

class NIVLRepositoryImpl extends NIVLRepository {
  final NIVLService _nivlService;
  final NivlDaoService _nivlDao;

  static const _REFRESH_TIME = 10 * 1000; // 10 seconds
  var _last_refresh = 0;

  NIVLRepositoryImpl(this._nivlService, this._nivlDao);

  @override
  Future<List<NIVLDataModel>> getNIVLData(String query, String mediaType,
      {bool forceRefresh = false}) async {
    final isCanRefresh = DateTime.now().millisecondsSinceEpoch > (_last_refresh + _REFRESH_TIME);

    var cache = NIVLDtoToModelMapper.to(await _nivlDao.get());
    if (cache.isNotEmpty && !forceRefresh && !isCanRefresh) {
      return cache;
    }

    var result = await _nivlService.nivlSearch(query, mediaType);
    var data = NIVLSearchMapper.call(result);

    _last_refresh = DateTime.now().millisecondsSinceEpoch;
    await _nivlDao.addAll(NIVLDtoToModelMapper.from(data));

    return data;
  }
}
