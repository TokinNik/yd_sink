part of 'register_screen_bloc.dart';

class RegisterScreenState extends Equatable {
  final bool isLoading;
  final Exception? error;

  const RegisterScreenState({
    this.isLoading = false,
    this.error,
  });

  RegisterScreenState copyWith({
    bool? isLoading,
    Exception? Function()? error,
  }) {
    return RegisterScreenState(
      isLoading: isLoading ?? this.isLoading,
      error: error == null ? this.error : error.call(),
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
      ];
}
