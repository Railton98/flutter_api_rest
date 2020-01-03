import 'package:dio/dio.dart';
import 'package:flutter_api_rest/src/shared/constants.dart';
import 'package:flutter_api_rest/src/shared/custom_dio/interceptors.dart';

class CustomDio extends Dio {
  CustomDio() {
    options.baseUrl = BASE_URL;
    interceptors.add(CustomIntercetors());
  }
}
