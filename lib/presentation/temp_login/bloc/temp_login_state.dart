part of 'temp_login_bloc.dart';

class TempLoginScreenState extends Equatable {
  final bool isLoading;
  final Exception? error;

  const TempLoginScreenState({
    this.isLoading = false,
    this.error,
  });

  TempLoginScreenState copyWith({
    bool? isLoading,
    Exception? Function()? error,
  }) {
    return TempLoginScreenState(
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
