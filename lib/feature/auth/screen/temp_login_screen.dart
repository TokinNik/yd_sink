import 'package:YDsync/core/models/error_handler.dart';
import 'package:YDsync/feature/auth/bloc/login/temp_login_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

TempLoginScreenCubit _bloc(context) => BlocProvider.of<TempLoginScreenCubit>(context);

@RoutePage()
class TempLoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const TempLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TempLoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TempLoginScreenCubit>(
      create: (c) => TempLoginScreenCubit(GetIt.instance.get()),
      child: const TempLoginScreen(),
    );
  }
}

class _TempLoginScreenState extends State<TempLoginScreen> with ErrorHandlerMixin {
  _onError(Exception e, {StackTrace? trace}) {
    errorHandler.handleError(e: e, stackTrace: trace);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _blocListener(BuildContext context, TempLoginScreenState state) {
    if (state.login.isError) {
      _onError(state.login.exception!.exception, trace: state.login.exception!.trace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TempLoginScreenCubit, TempLoginScreenState>(builder: _buildScreen, listener: _blocListener);
  }

  Widget _buildScreen(BuildContext context, TempLoginScreenState state) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                state.login.isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                      onPressed: () {
                        _bloc(context).login();
                      },
                      child: const Text("Login"),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
