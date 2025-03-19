import 'package:dio/dio.dart';
import 'package:oop/core/networking/api_constants.dart';
import 'package:oop/features/login/data/models/login_request_body.dart';
import 'package:oop/features/login/data/models/login_response_body.dart';
import 'package:oop/features/signup/data/model/sign_up_request_body.dart';
import 'package:oop/features/signup/data/model/sign_up_response_body.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @GET("/posts")
  // Future<List<Post>> getPosts();
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signUp)
  Future<SignUpResponseBody> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
