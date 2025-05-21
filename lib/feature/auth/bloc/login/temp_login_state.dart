part of 'temp_login_bloc.dart';

class TempLoginScreenState extends Equatable {
  final DataState<bool> login;

  const TempLoginScreenState({this.login = const DataState()});

  TempLoginScreenState copyWith({DataState<bool>? login}) {
    return TempLoginScreenState(login: login ?? this.login);
  }

  @override
  List<Object?> get props => [login];
}
