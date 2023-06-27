import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ytech/core/network/interceptors/authorization_interceptor.dart';
import 'package:ytech/core/network/interceptors/header_interceptor.dart';
import 'package:ytech/core/network/interceptors/logger_interceptor.dart';
import 'package:ytech/core/utils/const.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_models/add_customer_body_model.dart';
import 'package:ytech/features/customers/add_customer/data/add_customer_models/add_customer_model.dart';

class DioAddCustomer {
  final Dio _dio;

  DioAddCustomer()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
            HeaderInterceptor(),
          ]);

  Future<AddCustomerModel> addCustomer(
      {required AddCustomerBodyModel addCustomerBodyModel}) async {
    try {
      var res = await _dio.post('services/app/MobileCustomer/CreateNewCustomer',
          data: addCustomerBodyModelToJson(addCustomerBodyModel));
      return addCustomerModelFromJson(res.toString());
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }
}
