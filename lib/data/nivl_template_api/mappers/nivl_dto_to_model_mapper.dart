import 'package:template_app/data/core/local/drift.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';

class NIVLDtoToModelMapper {
  static List<NIVLDtoCompanion> from(List<NIVLDataModel> items) =>
      items.map((item) {
        return NIVLDtoCompanion.insert(
            id: item.id,
            type: item.type.mapName,
            title: item.title,
            subTitle: item.subTitle,
            image: item.image,
            date: item.date,
            center: item.center,
            mediaLink: item.mediaLink,
            keyWord: item.keyWord ?? []);
      }).toList();

  static List<NIVLDataModel> to(List<NIVLDtoData> items) => items.map((item) {
        return NIVLDataModel(
          type: NIVLType.fromString(item.type),
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
