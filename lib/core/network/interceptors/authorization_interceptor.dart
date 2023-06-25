import 'package:dio/dio.dart';

import '../../utils/shared_preferences.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await getToken();
    options.headers['token'] = token;
    options.headers['Authorization'] = token;
    super.onRequest(options, handler);
  }
}
