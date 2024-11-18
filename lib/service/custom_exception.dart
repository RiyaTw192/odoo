import 'package:dio/dio.dart';
import 'package:oddo_fe/service/api_errors.dart';

class CustomException implements Exception {
  late dynamic error;

  CustomException.fromDioError(
      DioException dioError, bool? handleResponseError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        error = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        error = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        error = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        error = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:
        error = handleResponseError == true
            ? ApiErrors.fromStatusCode(dioError.response?.statusCode)
            : dioError.response?.data;
        break;
      case DioExceptionType.connectionError:
        error = 'No Internet.';
        break;
      case DioExceptionType.unknown:
        error = 'Unexpected error occurred.';
        break;
      default:
        error = 'Something went wrong';
        break;
    }
  }
}
