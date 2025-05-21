import 'package:YDsync/core/data/local/drift.dart';
import 'package:YDsync/feature/nasa_media/model/nasa_media_search_model.dart';

class NasaMediaSearchDtoToDbMapper {
  static List<NasaMediaTableCompanion> from(List<NasaMediaSearchModel> items) =>
      items.map((item) {
        return NasaMediaTableCompanion.insert(
          id: item.id,
          type: item.type.mapName,
          title: item.title,
          subTitle: item.subTitle,
          image: item.image,
          date: item.date,
          center: item.center,
          mediaLink: item.mediaLink,
          keyWord: item.keyWord ?? [],
        );
      }).toList();

  static List<NasaMediaSearchModel> to(List<NasaMediaTableData> items) =>
      items.map((item) {
        return NasaMediaSearchModel(
          type: NasaFileType.fromString(item.type),
          title: item.title,
          subTitle: item.subTitle,
          image: item.image,
          date: item.date,
          id: item.id,
          center: item.center,
          mediaLink: item.mediaLink,
          keyWord: item.keyWord,
        );
      }).toList();
}
