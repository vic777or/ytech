// To parse this JSON data, do
//
//     final addCustomerModel = addCustomerModelFromJson(jsonString);

import 'dart:convert';

AddCustomerModel addCustomerModelFromJson(String str) =>
    AddCustomerModel.fromJson(json.decode(str));

String addCustomerModelToJson(AddCustomerModel data) =>
    json.encode(data.toJson());

class AddCustomerModel {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  AddCustomerModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  AddCustomerModel copyWith({
    Result? result,
    dynamic targetUrl,
    bool? success,
    dynamic error,
    bool? unAuthorizedRequest,
    bool? abp,
  }) =>
      AddCustomerModel(
        result: result ?? this.result,
        targetUrl: targetUrl ?? this.targetUrl,
        success: success ?? this.success,
        error: error ?? this.error,
        unAuthorizedRequest: unAuthorizedRequest ?? this.unAuthorizedRequest,
        abp: abp ?? this.abp,
      );

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) =>
      AddCustomerModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        targetUrl: json["targetUrl"],
        success: json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"],
        abp: json["__abp"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "targetUrl": targetUrl,
        "success": success,
        "error": error,
        "unAuthorizedRequest": unAuthorizedRequest,
        "__abp": abp,
      };
}

class Result {
  int? code;
  dynamic data;
  bool? result;
  String? message;
  int? totalRecords;
  dynamic imgsUrl;

  Result({
    this.code,
    this.data,
    this.result,
    this.message,
    this.totalRecords,
    this.imgsUrl,
  });

  Result copyWith({
    int? code,
    dynamic data,
    bool? result,
    String? message,
    int? totalRecords,
    dynamic imgsUrl,
  }) =>
      Result(
        code: code ?? this.code,
        data: data ?? this.data,
        result: result ?? this.result,
        message: message ?? this.message,
        totalRecords: totalRecords ?? this.totalRecords,
        imgsUrl: imgsUrl ?? this.imgsUrl,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        data: json["data"],
        result: json["result"],
        message: json["message"],
        totalRecords: json["totalRecords"],
        imgsUrl: json["imgsUrl"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "result": result,
        "message": message,
        "totalRecords": totalRecords,
        "imgsUrl": imgsUrl,
      };
}
