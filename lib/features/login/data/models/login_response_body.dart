import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  String? message;
  @JsonKey(name: 'data')
  UserDate? userDate;
  int? code;
  bool? status;

  LoginResponseBody({
    this.message,
    this.userDate,
    this.code,
    this.status,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}

@JsonSerializable()
class UserDate {
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  UserDate({
    this.token,
    this.userName,
  });
  factory UserDate.fromJson(Map<String, dynamic> json) =>
      _$UserDateFromJson(json);
}
