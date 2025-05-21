import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../auth/screen/register_screen.dart';
import '../auth/screen/temp_login_screen.dart';
import '../empty/temp_empty_screen.dart';
import '../nasa_media/model/nasa_media_search_model.dart';
import '../nasa_media/screen/nasa_media/nasa_media_screen.dart';
import '../nasa_media/screen/nasa_media_details/nasa_media_details_screen.dart';
import '../profile/screen/profile_screen.dart';
import '../random/random_color_screen.dart';
import '../splash/splash_screen.dart';
import '../tabs/temp_tabs_screen.dart';
import '../welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashRoute.page, initial: true),
    // Auth Route
    AutoRoute(path: '/welcome', page: WelcomeRoute.page),
    AutoRoute(path: '/login', page: TempLoginRoute.page),
    AutoRoute(path: '/register', page: RegisterRoute.page),
    // Tab Route
    AutoRoute(
      path: '/tabs',
      page: TempTabsRoute.page,
      children: [
        AutoRoute(
          path: "first",
          page: FirstTab.page,
          initial: true,
          children: [AutoRoute(path: "", page: TempEmptyRoute.page)],
        ),
        AutoRoute(path: "second", page: SecondTab.page, children: [AutoRoute(path: "", page: TempEmptyRoute.page)]),
      ],
    ),
    // Out Tab Route
    AutoRoute(path: '/details', page: NasaMediaDetailsRoute.page),
    AutoRoute(path: '/nasa', page: NasaMediaRoute.page),
    AutoRoute(path: '/profile', page: ProfileRoute.page),
  ];
}

@RoutePage(name: 'FirstTab')
class FirstTabScreen extends AutoRouter {
  const FirstTabScreen({super.key});
}

@RoutePage(name: 'SecondTab')
class SecondTabsScreen extends AutoRouter {
  const SecondTabsScreen({super.key});
}
