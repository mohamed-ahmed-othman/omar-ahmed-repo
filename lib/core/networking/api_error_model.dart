// import 'package:json_annotation/json_annotation.dart';
// part 'api_error_model.g.dart';

// @JsonSerializable()
// class ApiErrorModel {
//   final String? message;
//   final List<String>? errors;

//   ApiErrorModel({this.message, this.errors});

//   factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
//       _$ApiErrorModelFromJson(json);
//   Map<String,dynamic> toJson() => _$ApiErrorModelToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? code;
  final String? message;
  final Map<String, List<String>>? data;

  ApiErrorModel({this.code, this.message, this.data});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
