part of '{{name.snakeCase()}}_screen_bloc.dart';

class {{name.pascalCase()}}ScreenState extends Equatable {
  final bool isLoading;

  const {{name.pascalCase()}}ScreenState({
    this.isLoading = false,
  });

  {{name.pascalCase()}}ScreenState copyWith({
    bool? isLoading,
  }) {
    return {{name.pascalCase()}}ScreenState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
  ];
}
