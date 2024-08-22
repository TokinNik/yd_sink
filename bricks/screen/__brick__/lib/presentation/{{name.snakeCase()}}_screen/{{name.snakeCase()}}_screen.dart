{{#withRoute}}import 'package:auto_route/auto_route.dart';{{/withRoute}}
{{#withStateManager}}
import 'bloc/{{name.snakeCase()}}_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
{{/withStateManager}}
import 'package:flutter/material.dart';
import '../app/screen_controller.dart';
{{^withRoute}}{{#withStateManager}}
class {{name.pascalCase()}}ScreenWrapper extends StatelessWidget {
  const {{name.pascalCase()}}ScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<{{name.pascalCase()}}ScreenBloc>(
      create: (c) => GetIt.instance.get(param1: ScreenController()),
      child: const {{name.pascalCase()}}Screen(),
    );
  }
}
{{/withStateManager}}{{/withRoute}}
{{#withRoute}}@RoutePage(){{/withRoute}}
class {{name.pascalCase()}}Screen extends StatelessWidget {{#withRoute}}{{#withStateManager}}implements AutoRouteWrapper{{/withStateManager}}{{/withRoute}} {
  const {{name.pascalCase()}}Screen({super.key});

  {{#withRoute}}{{#withStateManager}}
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<{{name.pascalCase()}}ScreenBloc>(
      create: (c) => GetIt.instance.get(param1: ScreenController()),
      child: const {{name.pascalCase()}}Screen(),
    );
  }
 {{/withStateManager}}{{/withRoute}}

  {{#withStateManager}}
  void _blocListener(BuildContext context, {{name.pascalCase()}}ScreenState state) {
    // todo
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{{name.pascalCase()}}ScreenBloc, {{name.pascalCase()}}ScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
  }

  @override
  Widget _buildScreen(BuildContext context, {{name.pascalCase()}}ScreenState state) {
    return const Placeholder();
  }
  {{/withStateManager}}
  {{^withStateManager}}
  @override
  Widget build(BuildContext context) {
  return const Placeholder();
  }
  {{/withStateManager}}
}
