part of 'temp_profile_bloc.dart';

class TempProfileScreenState extends Equatable {
  final bool isLoading;
  final List<RouteModel> routes;

  const TempProfileScreenState({
    this.isLoading = false,
    this.routes = const [],
  });

  TempProfileScreenState copyWith({
    bool? isLoading,
    List<RouteModel>? routes,
  }) {
    return TempProfileScreenState(
      isLoading: isLoading ?? this.isLoading,
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        routes,
      ];
}
