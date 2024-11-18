import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkInterceptor extends Interceptor {
  static bool isDialogShowing = false;
  static String previousRoute = '';
  static bool hasTriggered = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint("====ERROR STARTS====");
    }
    _handleError(err);
    return handler.next(err);
  }

  DioException? _handleError(DioException error) {
    // You can also handle error messages here based on the status code, such as logging out, etc.
    String errorTypeInfo = 'other errors! ';
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorTypeInfo = 'Connection timed out! ';
        return error;
      case DioExceptionType.sendTimeout:
        errorTypeInfo = "Request timed out!";
        break;
      case DioExceptionType.receiveTimeout:
        errorTypeInfo = "Response timed out!";
        break;
      case DioExceptionType.cancel:
        errorTypeInfo = "request cancellation!";
        break;
      case DioExceptionType.unknown:
        errorTypeInfo = "${error.message}";
        break;
      default:
        break;
    }
    final Map<String, dynamic> logData = {
      'url': error.requestOptions.baseUrl + error.requestOptions.path,
      'method': error.requestOptions.method,
      'headers': error.response?.headers,
      'data': error.response?.data,
      'statusCode': error.response?.statusCode,
      'statusMessage': error.response?.statusMessage,
      'errorType': error.type,
      'errorMessage': error.message,
      'errorTypeInfo': errorTypeInfo,
    };
    // _dealRequestInfo(logData, ERROR_TYPE_STR);
    if (kDebugMode) {
      debugPrint("====ERROR INFO====");
      debugPrint(logData.toString());
      debugPrint("====ERROR ENDS====");
    }

    if (error.type == DioExceptionType.badResponse &&
        !NetworkInterceptor.isDialogShowing) {
      NetworkInterceptor.isDialogShowing = true;

      return error;
    }
  }
}
