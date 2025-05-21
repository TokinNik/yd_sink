import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:YDsync/core/models/error_handler.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

import '../bloc/register/register_screen_bloc.dart';
import 'register_input_state.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegisterScreenBloc>(
      create: (c) => RegisterScreenBloc(GetIt.instance.get()),
      child: const RegisterScreen(),
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> with ErrorHandlerMixin {
  final RegisterInputState _inputState = RegisterInputState();
  final _formKey = GlobalKey<FormState>();

  bool isShowPassword = false;

  @override
  void dispose() {
    _inputState.dispose();
    super.dispose();
  }

  void _blocListener(BuildContext context, RegisterScreenState state) {
    // TODO(tnr): error handler rework
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterScreenBloc, RegisterScreenState>(builder: _buildScreen, listener: _blocListener);
  }

  Widget _buildScreen(BuildContext context, RegisterScreenState state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              state.register.isLoading
                  ? const CircularProgressIndicator()
                  : FilledButton(
                    onPressed: () {
                      if (!_inputState.hasError) {
                        context.bloc<RegisterScreenBloc>().register(
                          _inputState.emailInput.value,
                          _inputState.passwordInput.value,
                        );
                      }
                    },
                    child: const Text("Регистрация"),
                  ),
            ],
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
    validator: (value) => _inputState.passwordInput.errors.firstOrNull,
    obscureText: isShow,
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
