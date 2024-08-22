import 'package:template_app/data/main_api/models/remote/route_response.dart';
import 'package:template_app/domain/models/route_model.dart';

extension RouteResponseMapper on RouteResponse {
  List<RouteModel> get toModel => items.map((it) {
        return it.toModel;
      }).toList();
}

extension RouteItemResponseMapper on RouteItemResponse {
  RouteModel get toModel => RouteModel(id, createdAt, status, name, cityId,
      categoryId, description, durationTime, durationDistance, price);
}
