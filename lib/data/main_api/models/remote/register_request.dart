import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RegisterRequest {
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;

  RegisterRequest({required this.email, required this.password});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
