part of 'register_screen_bloc.dart';

class RegisterScreenState extends Equatable {
  final DataState<bool> register;

  const RegisterScreenState({this.register = const DataState()});

  RegisterScreenState copyWith({DataState<bool>? register}) {
    return RegisterScreenState(register: register ?? this.register);
  }

  @override
  List<Object?> get props => [register];
}
