import 'package:oop/core/networking/api_error_handler.dart';
import 'package:oop/core/networking/api_result.dart';
import 'package:oop/core/networking/api_service.dart';
import 'package:oop/features/login/data/models/login_request_body.dart';
import 'package:oop/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Future<ApiResult<SignUpResponseBody>> singUp(
  //     SignUpRequestBody signUpRequestBody) async {
  //   try {
  //     final response = await _apiService.signUp(signUpRequestBody);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(
  //         ApiErrorHandler().handle(error) as ApiErrorHandler);
  //   }
  // }
}
