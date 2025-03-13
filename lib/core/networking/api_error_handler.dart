import 'dart:io';
import 'package:dio/dio.dart';
import 'package:oop/core/networking/api_error_model.dart';

class ApiErrorHandler implements Exception {
  late String failure;
  String handle(dynamic error) {
    if (error is DioException) {
      failure = _handleDioError(error).toString();
      return failure;
    } else if (error is SocketException) {
      failure = _handleSocketError(error).message ??
          "No Internet connection. Please check your network.";
      return "No Internet connection. Please check your network.";
    } else {
      return "Unexpected error occurred. Please try again later.";
    }
  }

  ApiErrorModel _handleSocketError(SocketException error) {
    return ApiErrorModel(
        message: "No Internet connection. Please check your network.");
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond. Try again later.";
      case DioExceptionType.sendTimeout:
        return "Request took too long to send. Check your network.";
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return "Request was cancelled. Please retry.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  String _handleBadResponse(Response? response) {
    if (response == null) {
      return "No response from server. Please try again.";
    }

    try {
      final errorData = response.data;
      if (errorData is Map<String, dynamic>) {
        final apiError = ApiErrorModel.fromJson(errorData);
        return apiError.message ?? "Unknown error occurred.";
      } else if (errorData is String) {
        return errorData;
      }
    } catch (e) {
      return "Error parsing server response.";
    }

    switch (response.statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please log in again.";
      case 403:
        return "Access denied. You don't have permission.";
      case 404:
        return "Resource not found. Please try again later.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Error: ${response.statusCode}. Something went wrong.";
    }
  }
}

// // Dio Interceptor to handle errors globally
// class DioInterceptor extends Interceptor {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     final errorMessage = ApiErrorHandler.handleError(err);
//     super.onError(err, handler);
//   }
// }

// // Failure Model for Cubit
// class Failure {
//   final String message;
//   Failure(this.message);
// }
