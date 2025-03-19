// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseBody _$SignUpResponseBodyFromJson(Map<String, dynamic> json) =>
    SignUpResponseBody(
      message: json['message'] as String?,
      userDate: json['data'] == null
          ? null
          : UserDate.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as bool?,
    );

// ignore: unused_element
Map<String, dynamic> _$SignUpResponseBodyToJson(SignUpResponseBody instance) =>
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

// ignore: unused_element
Map<String, dynamic> _$UserDateToJson(UserDate instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.userName,
    };
