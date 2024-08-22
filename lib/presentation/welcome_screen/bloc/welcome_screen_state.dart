part of 'welcome_screen_bloc.dart';

class WelcomeScreenState extends Equatable {
  final bool isLoading;

  const WelcomeScreenState({
    this.isLoading = false,
  });

  WelcomeScreenState copyWith({
    bool? isLoading,
  }) {
    return WelcomeScreenState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
      ];
}
