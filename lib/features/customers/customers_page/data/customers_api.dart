import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ytech/core/network/interceptors/authorization_interceptor.dart';
import 'package:ytech/core/network/interceptors/header_interceptor.dart';
import 'package:ytech/core/network/interceptors/logger_interceptor.dart';
import 'package:ytech/core/utils/const.dart';
import 'package:ytech/features/customers/customers_page/data/customers_models/customers_model.dart';

class DioCustomers {
  final Dio _dio;

  DioCustomers()
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

  Future<CustomersModel> getCustomers(
      {required dynamic pageSize, required dynamic pageNumber}) async {
    try {
      var res = await _dio.get(
        'services/app/MobileCustomer/GetFilteredCustomers?ParameterPagination.PageNumber=$pageNumber&ParameterPagination.PageSize=$pageSize',
      );
      return customersModelFromJson(res.toString());
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }
}
