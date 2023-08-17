import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'dio_service_interceptor.dart';

class DioService extends DioForNative {
  static const baseUrl = 'https://api.github.com';

  DioService() : super(BaseOptions(baseUrl: baseUrl)) {
    super.interceptors.add(DioServiceInterceptor());
  }
}
