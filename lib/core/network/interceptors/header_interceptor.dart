import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Connection'] = 'keep-alive';
    //options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    options.headers['Accept'] = '*/*';
    options.headers['Content-Type'] = 'application/json';
    // options.headers['Content-Length'] = '*';
    super.onRequest(options, handler);
  }
}
