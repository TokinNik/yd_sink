import 'package:collection/collection.dart';
import 'package:YDsync/feature/nasa_media/data/models/remote/nasa_search_image_response.dart';
import 'package:YDsync/feature/nasa_media/model/nasa_media_search_model.dart';

class NasaMediaSearchMapper {
  static List<NasaMediaSearchModel> call(NasaMediaSearchResponse result) =>
      result.collection.items.map((item) {
        var firstItem = item.data?.first;
        return NasaMediaSearchModel(
          type: NasaFileType.values.firstWhereOrNull((e) => e.mapName == firstItem?.type) ?? NasaFileType.image,
          title: firstItem?.title ?? "-",
          subTitle: firstItem?.subTitle ?? "-",
          image: item.links?.firstOrNull?.href ?? "-",
          date: firstItem?.date ?? "-",
          id: firstItem?.nasaId ?? "-",
          center: firstItem?.center ?? "-",
          mediaLink: firstItem?.mediaLink ?? "-",
          keyWord: firstItem?.keyWord,
        );
      }).toList();
}
