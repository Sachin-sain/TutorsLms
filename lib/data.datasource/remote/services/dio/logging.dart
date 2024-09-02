import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../local/local_storage.dart';
class Logging extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('METHOD -::> [${options.method}]');
      print('API URL: ${options.baseUrl}${options.path}');
      print('QUERY PARAMETER -:> ${options.queryParameters}');
      log('REQUEST-:> ${options.data}');
    }
    if(LocalStorage.getAuthToken().isNotEmpty) {
      options.headers['Authorization']= LocalStorage.getAuthToken();  ///
    }

    log('HEADERS -:> ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('STATUS CODE -:> ${response.statusCode}');
      log('RESPONSE-:> ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR CODE -:> ${err.response?.statusCode}');
      log('ERROR RESPONSE -:> ${err.response?.data}');
      print('ERROR MESSAGE -:> ${err.message}');
    }
    return super.onError(err, handler);
  }
}