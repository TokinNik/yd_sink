// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FirstTabScreen]
class FirstTab extends PageRouteInfo<void> {
  const FirstTab({List<PageRouteInfo>? children})
    : super(FirstTab.name, initialChildren: children);

  static const String name = 'FirstTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirstTabScreen();
    },
  );
}

/// generated route for
/// [NasaMediaDetailsScreen]
class NasaMediaDetailsRoute extends PageRouteInfo<NasaMediaDetailsRouteArgs> {
  NasaMediaDetailsRoute({
    Key? key,
    required NasaMediaSearchModel model,
    List<PageRouteInfo>? children,
  }) : super(
         NasaMediaDetailsRoute.name,
         args: NasaMediaDetailsRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'NasaMediaDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NasaMediaDetailsRouteArgs>();
      return NasaMediaDetailsScreen(key: args.key, model: args.model);
    },
  );
}

class NasaMediaDetailsRouteArgs {
  const NasaMediaDetailsRouteArgs({this.key, required this.model});

  final Key? key;

  final NasaMediaSearchModel model;

  @override
  String toString() {
    return 'NasaMediaDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [NasaMediaScreen]
class NasaMediaRoute extends PageRouteInfo<void> {
  const NasaMediaRoute({List<PageRouteInfo>? children})
    : super(NasaMediaRoute.name, initialChildren: children);

  static const String name = 'NasaMediaRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NasaMediaScreen());
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ProfileScreen());
    },
  );
}

/// generated route for
/// [RandomColorScreen]
class RandomColorRoute extends PageRouteInfo<void> {
  const RandomColorRoute({List<PageRouteInfo>? children})
    : super(RandomColorRoute.name, initialChildren: children);

  static const String name = 'RandomColorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RandomColorScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RegisterScreen());
    },
  );
}

/// generated route for
/// [SecondTabsScreen]
class SecondTab extends PageRouteInfo<void> {
  const SecondTab({List<PageRouteInfo>? children})
    : super(SecondTab.name, initialChildren: children);

  static const String name = 'SecondTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SecondTabsScreen();
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
/// [TempEmptyScreen]
class TempEmptyRoute extends PageRouteInfo<TempEmptyRouteArgs> {
  TempEmptyRoute({Key? key, int deep = 0, List<PageRouteInfo>? children})
    : super(
        TempEmptyRoute.name,
        args: TempEmptyRouteArgs(key: key, deep: deep),
        initialChildren: children,
      );

  static const String name = 'TempEmptyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TempEmptyRouteArgs>(
        orElse: () => const TempEmptyRouteArgs(),
      );
      return WrappedRoute(
        child: TempEmptyScreen(key: args.key, deep: args.deep),
      );
    },
  );
}

class TempEmptyRouteArgs {
  const TempEmptyRouteArgs({this.key, this.deep = 0});

  final Key? key;

  final int deep;

  @override
  String toString() {
    return 'TempEmptyRouteArgs{key: $key, deep: $deep}';
  }
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

/// generated route for
/// [TempTabsScreen]
class TempTabsRoute extends PageRouteInfo<void> {
  const TempTabsRoute({List<PageRouteInfo>? children})
    : super(TempTabsRoute.name, initialChildren: children);

  static const String name = 'TempTabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TempTabsScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const WelcomeScreen());
    },
  );
}
