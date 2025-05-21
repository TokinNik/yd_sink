part of 'profile_bloc.dart';

class ProfileScreenState extends Equatable {
  final DataState<List<RouteModel>> routes;
  final DataState<bool> tokenRefresh;

  const ProfileScreenState({this.routes = const DataState(), this.tokenRefresh = const DataState()});

  ProfileScreenState copyWith({DataState<List<RouteModel>>? routes, DataState<bool>? tokenRefresh}) {
    return ProfileScreenState(routes: routes ?? this.routes, tokenRefresh: tokenRefresh ?? this.tokenRefresh);
  }

  @override
  List<Object?> get props => [routes, tokenRefresh];
}
