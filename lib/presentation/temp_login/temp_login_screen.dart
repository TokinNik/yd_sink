import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/domain/core/error_handler.dart';
import 'package:template_app/presentation/app/screen_controller.dart';
import 'package:template_app/presentation/temp_login/bloc/temp_login_bloc.dart';
import 'package:template_app/presentation/temp_login/login_input_state.dart';
import 'package:template_app/ui/ui.dart';
import 'package:template_app/utils/extensions/context_extensions.dart';

TempLoginScreenCubit _bloc(context) =>
    BlocProvider.of<TempLoginScreenCubit>(context);

@RoutePage()
class TempLoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const TempLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TempLoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TempLoginScreenCubit>(
      create: (c) =>
          TempLoginScreenCubit(GetIt.instance.get(), ScreenController()),
      child: const TempLoginScreen(),
    );
  }
}

class _TempLoginScreenState extends State<TempLoginScreen>
    with ErrorHandlerMixin {
  final LoginInputsState _inputState = LoginInputsState();
  final _formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  _onError(Exception e) {
    errorHandler.handleError(
      e: e,
    );
  }

  @override
  void initState() {
    super.initState();
    context.bloc<TempLoginScreenCubit>().screenController.onError = _onError;
  }

  @override
  void dispose() {
    _inputState.dispose();
    super.dispose();
  }

  void _blocListener(BuildContext context, TempLoginScreenState state) {
    if (state.error != null) {
      showTopPopUp(
        context: context,
        message: state.error.toString(),
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TempLoginScreenCubit, TempLoginScreenState>(
      builder: _buildScreen,
      listener: _blocListener,
    );
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
                state.isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _bloc(context).login(
                              _inputState.emailInput.value,
                              _inputState.passwordInput.value,
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
                FilledButton(
                  onPressed: () {
                    _bloc(context).login(
                      "admin@admin.com",
                      "password",
                    );
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

  Widget _buildPasswordField(bool isShow, void Function() onToggle) =>
      TextFormField(
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
              child: Icon(
                isShow
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                size: 24,
              ),
            ),
          ),
        ),
      );
}
