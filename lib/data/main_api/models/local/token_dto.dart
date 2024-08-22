import 'package:isar/isar.dart';

part 'token_dto.g.dart';

@collection
class TokenDto {
  late Id id;

  late String accessToken;
  late String refreshToken;
}
