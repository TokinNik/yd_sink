import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:template_app/presentation/app/screen_controller.dart';

import '../../domain/models/nivl_data_model.dart';
import '../random_color/random_color_screen.dart';
import '../register_screen/register_screen.dart';
import '../splash_screen/splash_screen.dart';
import '../temp_details/temp_details_screen.dart';
import '../temp_empty/temp_empty_screen.dart';
import '../temp_list/temp_list_screen.dart';
import '../temp_login/temp_login_screen.dart';
import '../temp_profile/temp_profile_screen.dart';
import '../temp_tabs/temp_tabs_screen.dart';
import '../welcome_screen/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        // Auth Route
        AutoRoute(path: '/welcome', page: WelcomeRoute.page),
        AutoRoute(path: '/login', page: TempLoginRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/forget', page: TempLoginRoute.page),
        // Tab Route
        AutoRoute(path: '/tabs', page: TempTabsRoute.page, children: [
          AutoRoute(
              path: "first",
              page: FirstTab.page,
              initial: true,
              children: [AutoRoute(path: "", page: TempEmptyRoute.page)]),
          AutoRoute(
              path: "second",
              page: SecondTab.page,
              children: [AutoRoute(path: "", page: TempEmptyRoute.page)]),
        ]),
        // Out Tab Route
        AutoRoute(path: '/details', page: TempDetailsRoute.page),
        AutoRoute(path: '/list', page: TempListRoute.page),
        AutoRoute(path: '/profile', page: TempProfileRoute.page),
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
