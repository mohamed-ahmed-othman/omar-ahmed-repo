import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Duration timeout = const Duration(seconds: 30);
  static Dio? dio;
  static Future<Dio> getDio() async {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptors() {
    // dio!.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     // Do something before request is sent
    //     return handler.next(options); //continue
    //   },
    //   onResponse: (response, handler) {
    //     // Do something with response data
    //     return handler.next(response); // continue
    //   },
    //   onError: (DioException e, handler) {
    //     // Do something with response error
    //     return handler.next(e); //continue
    //   },
    // ));
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );
  }
}
