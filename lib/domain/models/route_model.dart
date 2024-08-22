import 'package:equatable/equatable.dart';

class RouteModel extends Equatable {
  final String id;
  final String createdAt;
  final String status;
  final String name;
  final String cityId;
  final String categoryId;
  final String description;
  final int durationTime;
  final int durationDistance;
  final int price;

  const RouteModel(
    this.id,
    this.createdAt,
    this.status,
    this.name,
    this.cityId,
    this.categoryId,
    this.description,
    this.durationTime,
    this.durationDistance,
    this.price,
  );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        status,
        name,
        cityId,
        categoryId,
        description,
        durationTime,
        durationDistance,
        price,
      ];
}
