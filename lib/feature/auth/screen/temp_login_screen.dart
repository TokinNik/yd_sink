import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:YDsync/core/models/error_handler.dart';
import 'package:YDsync/feature/auth/bloc/login/temp_login_bloc.dart';
import 'package:YDsync/feature/auth/models/login_input_state.dart';

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
  final LoginInputsState _inputState = LoginInputsState();
  final _formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  _onError(Exception e, {StackTrace? trace}) {
    errorHandler.handleError(e: e, stackTrace: trace);
  }

  @override
  void dispose() {
    _inputState.dispose();
    super.dispose();
  }

  void _blocListener(BuildContext context, TempLoginScreenState state) {
    //TODO: error handler rework
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
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      _buildEmailField(),
                      // _buildLoginField(),
                      _buildPasswordField(isShowPassword, () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                state.login.isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _bloc(context).login(_inputState.emailInput.value, _inputState.passwordInput.value);
                        }
                      },
                      child: const Text("Login"),
                    ),
                FilledButton(
                  onPressed: () {
                    _bloc(context).login("admin@admin.com", "password");
                  },
                  child: const Text("fast debug Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() => TextFormField(
    controller: _inputState.emailInput.controller,
    validator: (value) => _inputState.emailInput.errors.firstOrNull,
  );

  Widget _buildPasswordField(bool isShow, void Function() onToggle) => TextFormField(
    controller: _inputState.passwordInput.controller,
    obscureText: isShow,
    validator: (value) => _inputState.passwordInput.errors.firstOrNull,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: "Password",
      filled: true,
      isDense: true,
      suffixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: GestureDetector(
          onTap: onToggle,
          child: Icon(isShow ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 24),
        ),
      ),
    ),
  );
}
