part of 'splash_bloc.dart';

class SplashScreenState extends Equatable {
  final bool isLoading;
  final Exception? error;

  const SplashScreenState({
    this.isLoading = false,
    this.error,
  });

  SplashScreenState copyWith({
    Exception? Function()? error,
    bool? isLoading,
  }) {
    return SplashScreenState(
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
