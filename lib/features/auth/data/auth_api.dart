import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/interceptors/header_interceptor.dart';
import '../../../core/network/interceptors/logger_interceptor.dart';
import '../../../core/utils/const.dart';
import 'login_models/login_body_mode.dart';
import 'login_models/login_model.dart';

class DioAuth {
  final Dio _dio;

  DioAuth()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            LoggerInterceptor(),
            HeaderInterceptor(hasTerminalKey: false),
          ]);

  Future<LoginModel> login({required LoginBodyModel loginBodyModel}) async {
    try {
      var res = await _dio.post(
        'MobileTokenAuth/LoginTerminal',
        data: loginBodyModelToJson(loginBodyModel),
      );
      return loginModelFromJson(res.toString());
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }
}
