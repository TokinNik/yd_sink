import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/presentation/app/app_router.dart';
import 'package:template_app/presentation/temp_empty/bloc/temp_empty_bloc.dart';
import 'dart:math' as math;

@RoutePage()
class TempEmptyScreen extends StatelessWidget implements AutoRouteWrapper {
  final int deep;

  const TempEmptyScreen({super.key, this.deep = 0});

  void _blocListener(BuildContext context, state) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TempEmptyScreenBloc, TempEmptyScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
  }

  Widget _buildScreen(BuildContext context, TempEmptyScreenState state) {
    return Scaffold(
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Deep $deep"),
            FilledButton(
              onPressed: () {
                context.pushRoute(TempEmptyRoute(deep: deep + 1));
              },
              child: Text("In deep ${deep + 1}"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TempEmptyScreenBloc>(
      create: (c) => TempEmptyScreenBloc(),
      child: TempEmptyScreen(deep: deep),
    );
  }
}
