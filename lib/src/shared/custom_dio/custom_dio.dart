import 'package:dio/dio.dart';
import 'package:flutter_api_rest/src/shared/constants.dart';
import 'package:flutter_api_rest/src/shared/custom_dio/interceptors.dart';

class CustomDio {
  Dio createDio() {
    Dio dio = Dio();

    dio.options.baseUrl = BASE_URL;
    dio.interceptors.add(CustomIntercetors());
    dio.options.connectTimeout = 5000;

    return dio;
  }
}
