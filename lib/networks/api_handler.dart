import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:oddo_fe/networks/network_interceptor.dart';
import 'package:oddo_fe/service/api_errors.dart';
import 'package:oddo_fe/service/api_interceptors.dart';
import 'package:oddo_fe/service/custom_exception.dart';
import 'package:oddo_fe/service/header_options.dart';

class ApiHandler {
  final options = CacheOptions(
    // A default store is required for interceptor.
    store: MemCacheStore(),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.noCache,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [200],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  Dio getDioIns(HeaderOptions? headerOptions) {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptor(headerOptions ?? HeaderOptions()));
    dio.interceptors.add(NetworkInterceptor());
    dio.interceptors.add(DioCacheInterceptor(options: options));
    return dio;
  }

  Future<dynamic> get(
      {required String url,
      HeaderOptions? headerOptions,
      CachePolicy? cachePolicy}) async {
    try {
      Response<dynamic> response = await getDioIns(headerOptions).get(url,
          options: options
              .copyWith(policy: cachePolicy ?? CachePolicy.noCache)
              .toOptions());
      dynamic responseJson = _response(response);
      return responseJson;
    } on DioError catch (err) {
      throw CustomException.fromDioError(
              err, headerOptions?.handleResponseError)
          .error;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? body,
      HeaderOptions? headerOptions}) async {
    try {
      Response<dynamic> response =
          await getDioIns(headerOptions).post(url, data: body);
      dynamic responseJson = _response(response);
      return responseJson;
    } on DioError catch (err) {
      throw CustomException.fromDioError(
              err, headerOptions?.handleResponseError)
          .error;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
      {required String url, HeaderOptions? headerOptions}) async {
    try {
      Response<dynamic> response = await getDioIns(headerOptions).delete(url);
      dynamic responseJson = _response(response);
      return responseJson;
    } on DioError catch (err) {
      throw CustomException.fromDioError(
              err, headerOptions?.handleResponseError)
          .error;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
      {required String url,
      Map<String, dynamic>? body,
      HeaderOptions? headerOptions}) async {
    try {
      Response<dynamic> response =
          await getDioIns(headerOptions).put(url, data: body);
      dynamic responseJson = _response(response);
      return responseJson;
    } on DioError catch (err) {
      throw CustomException.fromDioError(
              err, headerOptions?.handleResponseError)
          .error;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> customPostPut(
      {required String url,
      bool? isPut,
      dynamic body,
      HeaderOptions? headerOptions}) async {
    ///dynamic body, pass true for put method.. default is post method
    try {
      Response<dynamic>? response;
      if (isPut == true) {
        response = await getDioIns(headerOptions).put(url, data: body);
      } else {
        response = await getDioIns(headerOptions).post(url, data: body);
      }
      dynamic responseJson = _response(response);
      return responseJson;
    } on DioError catch (err) {
      throw CustomException.fromDioError(
              err, headerOptions?.handleResponseError)
          .error;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> retry(RequestOptions? requestOptions) async {
    final options = Options(
        method: requestOptions?.method,
        headers: requestOptions?.headers,
        responseType: requestOptions?.responseType);

    return Dio().request(requestOptions?.path ?? "",
        data: requestOptions?.data,
        queryParameters: requestOptions?.queryParameters,
        options: options);
  }

  dynamic _response(Response<dynamic> response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw ApiErrors.fromStatusCode(response.statusCode);
    }
  }
}
