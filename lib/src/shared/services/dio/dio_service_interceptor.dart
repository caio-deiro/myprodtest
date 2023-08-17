import 'package:dio/dio.dart';
import 'package:myprodtest/src/shared/constants/api_key.dart';

class DioServiceInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer ${ApiKey.apiKey}';

    return super.onRequest(options, handler);
  }
}
