import 'package:YDsync/core/app_global/auth_notifier.dart';
import 'package:YDsync/core/app_global/setting_notifier.dart';
import 'package:YDsync/core/i10n/strings.g.dart';
import 'package:YDsync/core/ui/themes/app_themes.dart';
import 'package:YDsync/core/ui/utils/widget_extenstions.dart';
import 'package:YDsync/environment/environments.dart';
import 'package:YDsync/environment/loggers/log.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_router.dart';
import 'fast_setting_modal.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  final _appRouter = AppRouter();
  bool showSettings = false;

  @override
  void initState() {
    super.initState();

    authStateNotificator.addListener(() {
      switch (authStateNotificator.value) {
        case AuthState.noAuth:
          // login route
          _appRouter.replace(const TempLoginRoute());
        case AuthState.auth:
          // main route
          _appRouter.replace(const DiskSyncRoute());
        case AuthState.waitCheck:
        // main splash or some loader screen
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      logD("Check device type:AppWidget: isTablet = ${context.isTablet}");
      Environment.isTablet = context.isTablet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp();
  }

  Widget _buildApp() {
    return MaterialApp.router(
      routerConfig: _appRouter.config(deepLinkTransformer: DeepLink.prefixStripper("/deeplink")),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: settingStateNotificator.value.themeMode,
      supportedLocales: AppLocaleUtils.supportedLocales,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Stack(children: [child ?? const SizedBox.shrink(), _buildBanner(), _buildFastSettingModal()]);
      },
      // home: const SplashScreen(),
    );
  }

  Widget _buildBanner() =>
      Environment.isProd
          ? const SizedBox.shrink()
          : Align(
            alignment: Alignment.topRight,
            child: Material(
              color: const Color(0x00ffffff),
              child: InkWell(
                onTap:
                    () => setState(() {
                      showSettings = true;
                    }),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, right: 55),
                  child: Banner(message: Environment.appVersion, location: BannerLocation.bottomStart),
                ),
              ),
            ),
          );

  Widget _buildFastSettingModal() =>
      showSettings
          ? FastSettingModal(
            toggleShow: () {
              setState(() {
                showSettings = !showSettings;
              });
            },
          )
          : const SizedBox.shrink();
}
