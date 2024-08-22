import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/presentation/app/app_router.dart';
import 'bloc/welcome_screen_bloc.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const WelcomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WelcomeScreenBloc>(
      create: (c) => WelcomeScreenBloc(),
      child: const WelcomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomeScreenBloc, WelcomeScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
  }

  void _blocListener(BuildContext context, WelcomeScreenState state) {
    // todo some
  }

  Widget _buildScreen(BuildContext context, WelcomeScreenState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () => context.pushRoute(const TempLoginRoute()),
                child: const Text("Вход")),
            FilledButton(
                onPressed: () => context.pushRoute(const RegisterRoute()),
                child: const Text("Регистрация")),
          ],
        ),
      ),
    );
  }
}
