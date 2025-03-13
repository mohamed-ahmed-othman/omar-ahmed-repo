// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      message: json['message'] as String?,
      userDate: json['data'] == null
          ? null
          : UserDate.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userDate,
      'code': instance.code,
      'status': instance.status,
    };

UserDate _$UserDateFromJson(Map<String, dynamic> json) => UserDate(
      token: json['token'] as String?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$UserDateToJson(UserDate instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.userName,
    };
