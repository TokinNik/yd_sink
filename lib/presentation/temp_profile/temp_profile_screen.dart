import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/domain/core/core.dart';
import 'package:template_app/domain/models/route_model.dart';
import 'package:template_app/presentation/app/app_router.dart';
import 'package:template_app/presentation/app/screen_controller.dart';
import 'package:template_app/presentation/temp_profile/bloc/temp_profile_bloc.dart';
import 'package:template_app/utils/extensions/context_extensions.dart';

TempProfileScreenCubit _bloc(context) =>
    BlocProvider.of<TempProfileScreenCubit>(context);

@RoutePage()
class TempProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const TempProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TempProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TempProfileScreenCubit>(
      create: (c) => TempProfileScreenCubit(
          GetIt.instance.get(), GetIt.instance.get(), ScreenController()),
      child: const TempProfileScreen(),
    );
  }
}

class _TempProfileScreenState extends State<TempProfileScreen>
    with ErrorHandlerMixin {
  _onError(Exception e) {
    errorHandler.handleError(
      e: e,
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc(context).screenController.onError = _onError;
    _bloc(context).loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _blocListener(BuildContext context, TempProfileScreenState state) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TempProfileScreenCubit, TempProfileScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
  }

  Widget _buildScreen(BuildContext context, TempProfileScreenState state) {
    return Scaffold(
      backgroundColor: context.colors.main,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : _buildProfileData(state.routes),
                FilledButton(
                  onPressed: () {
                    _bloc(context).logout();
                  },
                  child: const Text("Logout"),
                ),
                FilledButton(
                  onPressed: () {
                    _bloc(context).refreshToken();
                  },
                  child: const Text("Refresh Token"),
                ),
                FilledButton(
                  onPressed: () {
                    context.router.push(const TempListRoute());
                  },
                  child: const Text("To List"),
                ),
                FilledButton(
                  onPressed: () {
                    context.router.push(const TempTabsRoute());
                  },
                  child: const Text("To Tabs"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProfileData(List<RouteModel> routes) {
    if (routes.isEmpty) return const Text("routes is Empty ;(");

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Text(routes[index].name);
        },
      ),
    );
  }
}
