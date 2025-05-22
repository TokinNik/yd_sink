// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DiskSyncScreen]
class DiskSyncRoute extends PageRouteInfo<void> {
  const DiskSyncRoute({List<PageRouteInfo>? children})
    : super(DiskSyncRoute.name, initialChildren: children);

  static const String name = 'DiskSyncRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DiskSyncScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SplashScreen());
    },
  );
}

/// generated route for
/// [TempLoginScreen]
class TempLoginRoute extends PageRouteInfo<void> {
  const TempLoginRoute({List<PageRouteInfo>? children})
    : super(TempLoginRoute.name, initialChildren: children);

  static const String name = 'TempLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TempLoginScreen());
    },
  );
}
