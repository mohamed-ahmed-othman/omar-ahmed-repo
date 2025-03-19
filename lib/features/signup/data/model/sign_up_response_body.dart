import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response_body.g.dart';

@JsonSerializable()
class SignUpResponseBody {
  String? message;
  @JsonKey(name: 'data')
  UserDate? userDate;
  int? code;
  bool? status;

  SignUpResponseBody({
    this.message,
    this.userDate,
    this.code,
    this.status,
  });

  factory SignUpResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseBodyFromJson(json);
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
