import 'package:collection/collection.dart';
import 'package:template_app/data/nivl_template_api/models/remote/nivl_response.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';

class NIVLSearchMapper {
  static List<NIVLDataModel> call(NIVLResponse result) =>
      result.collection.items.map((item) {
        var firstItem = item.data?.first;
        return NIVLDataModel(
          type: NIVLType.values
                  .firstWhereOrNull((e) => e.mapName == firstItem?.type) ??
              NIVLType.image,
          title: firstItem?.title ?? "-",
          subTitle: firstItem?.subTitle ?? "-",
          image: firstItem?.image ?? "-",
          date: firstItem?.date ?? "-",
          id: firstItem?.nasaId ?? "-",
          center: firstItem?.center ?? "-",
          mediaLink: firstItem?.mediaLink ?? "-",
          keyWord: firstItem?.keyWord,
        );
      }).toList();
}
