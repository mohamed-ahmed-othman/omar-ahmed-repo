import 'package:oop/core/networking/api_error_handler.dart';
import 'package:oop/core/networking/api_service.dart';

import '../../../../core/networking/api_result.dart';
import '../model/sign_up_request_body.dart';
import '../model/sign_up_response_body.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);
  Future<ApiResult<SignUpResponseBody>> singUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
