import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:YDsync/core/i10n/strings.g.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';
import 'package:YDsync/environment/environments.dart';

import 'bloc/splash_bloc.dart';

SplashScreenBloc _bloc(context) => BlocProvider.of<SplashScreenBloc>(context);

@RoutePage()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(GetIt.instance.get()),
      child: const SplashScreen(),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  void _blocListener(BuildContext context, SplashScreenState state) {
    //
  }

  @override
  void initState() {
    super.initState();
    _bloc(context).add(SplashScreenEvent.didLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(builder: _buildScreen, listener: _blocListener);
  }

  Widget _buildScreen(BuildContext context, SplashScreenState state) {
    final appVersion = Environment.packageInfo.version;
    final appBuildNumber = Environment.isProd ? '' : "(${Environment.packageInfo.buildNumber})";

    final bannerText = '$appVersion $appBuildNumber';
    return Scaffold(
      backgroundColor: context.colors.contentPrimary,
      body: Stack(
        children: [
          Center(child: Assets.images.tempLogo.image(width: 220)),
          Positioned(
            bottom: 90,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Text(
                S.common.version(version: bannerText),
                style: AppTextStyles.s12regular.copyWith(color: context.colors.contentPrimary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
