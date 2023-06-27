import 'package:dio/dio.dart';
import 'package:ytech/core/utils/const.dart';
import 'package:ytech/main.dart';

class HeaderInterceptor extends Interceptor {
  final bool hasTerminalKey;

  HeaderInterceptor({this.hasTerminalKey = true});
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Connection'] = 'keep-alive';
    //options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    options.headers['Accept'] = '*/*';
    options.headers['Content-Type'] = 'application/json';
    // options.headers['Content-Length'] = '*';
    if (hasTerminalKey) {
      options.headers['Terminalkey'] =
          await sharedFunction.getShared(PrefKeys.terminalKey);
    }
    super.onRequest(options, handler);
  }
}
