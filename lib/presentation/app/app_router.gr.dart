// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FirstTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FirstTabScreen(),
      );
    },
    RandomColorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RandomColorScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RegisterScreen()),
      );
    },
    SecondTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecondTabsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashScreen()),
      );
    },
    TempDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TempDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TempDetailsScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    TempEmptyRoute.name: (routeData) {
      final args = routeData.argsAs<TempEmptyRouteArgs>(
          orElse: () => const TempEmptyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: TempEmptyScreen(
          key: args.key,
          deep: args.deep,
        )),
      );
    },
    TempListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: TempListScreen()),
      );
    },
    TempLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TempLoginScreen()),
      );
    },
    TempProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TempProfileScreen()),
      );
    },
    TempTabsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TempTabsScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WelcomeScreen()),
      );
    },
  };
}

/// generated route for
/// [FirstTabScreen]
class FirstTab extends PageRouteInfo<void> {
  const FirstTab({List<PageRouteInfo>? children})
      : super(
          FirstTab.name,
          initialChildren: children,
        );

  static const String name = 'FirstTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RandomColorScreen]
class RandomColorRoute extends PageRouteInfo<void> {
  const RandomColorRoute({List<PageRouteInfo>? children})
      : super(
          RandomColorRoute.name,
          initialChildren: children,
        );

  static const String name = 'RandomColorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecondTabsScreen]
class SecondTab extends PageRouteInfo<void> {
  const SecondTab({List<PageRouteInfo>? children})
      : super(
          SecondTab.name,
          initialChildren: children,
        );

  static const String name = 'SecondTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempDetailsScreen]
class TempDetailsRoute extends PageRouteInfo<TempDetailsRouteArgs> {
  TempDetailsRoute({
    Key? key,
    required NIVLDataModel model,
    List<PageRouteInfo>? children,
  }) : super(
          TempDetailsRoute.name,
          args: TempDetailsRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'TempDetailsRoute';

  static const PageInfo<TempDetailsRouteArgs> page =
      PageInfo<TempDetailsRouteArgs>(name);
}

class TempDetailsRouteArgs {
  const TempDetailsRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final NIVLDataModel model;

  @override
  String toString() {
    return 'TempDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [TempEmptyScreen]
class TempEmptyRoute extends PageRouteInfo<TempEmptyRouteArgs> {
  TempEmptyRoute({
    Key? key,
    int deep = 0,
    List<PageRouteInfo>? children,
  }) : super(
          TempEmptyRoute.name,
          args: TempEmptyRouteArgs(
            key: key,
            deep: deep,
          ),
          initialChildren: children,
        );

  static const String name = 'TempEmptyRoute';

  static const PageInfo<TempEmptyRouteArgs> page =
      PageInfo<TempEmptyRouteArgs>(name);
}

class TempEmptyRouteArgs {
  const TempEmptyRouteArgs({
    this.key,
    this.deep = 0,
  });

  final Key? key;

  final int deep;

  @override
  String toString() {
    return 'TempEmptyRouteArgs{key: $key, deep: $deep}';
  }
}

/// generated route for
/// [TempListScreen]
class TempListRoute extends PageRouteInfo<void> {
  const TempListRoute({List<PageRouteInfo>? children})
      : super(
          TempListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempLoginScreen]
class TempLoginRoute extends PageRouteInfo<void> {
  const TempLoginRoute({List<PageRouteInfo>? children})
      : super(
          TempLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempProfileScreen]
class TempProfileRoute extends PageRouteInfo<void> {
  const TempProfileRoute({List<PageRouteInfo>? children})
      : super(
          TempProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempTabsScreen]
class TempTabsRoute extends PageRouteInfo<void> {
  const TempTabsRoute({List<PageRouteInfo>? children})
      : super(
          TempTabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempTabsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
