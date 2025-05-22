import 'package:YDsync/feature/disk_sync/presentation/screens/disk_sync_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../auth/screen/temp_login_screen.dart';
import '../splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/login', page: TempLoginRoute.page),
    AutoRoute(path: '/disk_sync', page: DiskSyncRoute.page),
  ];
}
