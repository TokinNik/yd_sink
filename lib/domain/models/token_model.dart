import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  final String accessToken;
  final String refreshToken;

  const TokenModel(this.accessToken, this.refreshToken);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
