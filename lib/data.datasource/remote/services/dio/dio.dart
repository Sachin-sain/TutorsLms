import 'dart:io';
import 'package:dio/dio.dart';
import 'logging.dart';


class WebUtil {
  static Dio createDio() {
    var dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 180000); /// in milliseconds
    dio.options.receiveTimeout = const Duration(milliseconds: 180000); /// in milliseconds
    dio.interceptors.add(Logging());
    dio.options.followRedirects = true;
    dio.options.responseType = ResponseType.plain;
    return dio;
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}