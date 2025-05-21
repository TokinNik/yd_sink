import 'package:YDsync/feature/auth/data/models/route_response.dart';
import 'package:YDsync/feature/profile/models/route_model.dart';

extension RouteResponseMapper on RouteResponse {
  List<RouteModel> get toModel =>
      items.map((it) {
        return it.toModel;
      }).toList();
}

extension RouteItemResponseMapper on RouteItemResponse {
  RouteModel get toModel =>
      RouteModel(id, createdAt, status, name, cityId, categoryId, description, durationTime, durationDistance, price);
}
