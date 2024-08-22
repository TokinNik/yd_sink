import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';
import 'package:template_app/presentation/app/app_router.dart';
import 'package:template_app/presentation/temp_list/bloc/temp_list_bloc.dart';

@RoutePage()
class TempListScreen extends StatefulWidget implements AutoRouteWrapper {
  @override
  State<StatefulWidget> createState() => _TempListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TempListScreenBloc>(
      create: (c) => TempListScreenBloc(GetIt.instance.get())
        ..add(TempListScreenEvent.init()),
      child: TempListScreen(),
    );
  }
}

class _TempListScreenState extends State<TempListScreen> {
  void _blocListener(BuildContext context, state) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TempListScreenBloc, TempListScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
  }

  Widget _buildScreen(BuildContext context, TempListScreenState state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [...state.listOfElements.map((e) => _buildItem(e))],
        ),
      ),
    );
  }

  Widget _buildItem(NIVLDataModel model) => GestureDetector(
        onTap: () {
          context.router.push(TempDetailsRoute(model: model));
        },
        child: Text(model.title),
      );
}
