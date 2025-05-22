import 'package:YDsync/feature/disk_sync/data/models/resource_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'disk_sync_service.g.dart';

@RestApi()
abstract class DiskSyncService {
  factory DiskSyncService(Dio dio, {String baseUrl}) = _DiskSyncService;

  @GET('/disk/resources?path={folder}')
  Future<Resource> getFolder({
    @Path('folder') required String folder,
    @Query('limit') int? limit = 40,
    @Query('offset') int? offset = 0,
    @Query('sort') String? sort = '-modified',
    // name (имя ресурса);
    // path (путь к ресурсу на Диске);
    // created (дата создания ресурса);
    // modified (дата изменения ресурса);
    // size (размер файла).
  });
}
