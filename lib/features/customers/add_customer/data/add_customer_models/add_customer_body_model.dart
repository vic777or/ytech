// To parse this JSON data, do
//
//     final addCustomerBodyModel = addCustomerBodyModelFromJson(jsonString);

import 'dart:convert';

AddCustomerBodyModel addCustomerBodyModelFromJson(String str) => AddCustomerBodyModel.fromJson(json.decode(str));

String addCustomerBodyModelToJson(AddCustomerBodyModel data) => json.encode(data.toJson());

class AddCustomerBodyModel {
  String? id;
  String? enFullName;
  String? arFullName;
  String? address;
  String? email;
  String? commercialRegister;
  String? phoneNumber;
  String? cityId;
  String? storeId;
  String? taxIdNumber;
  bool? isDelivery;
  int? commission;
  String? customerCategoryId;
  bool? isActive;

  AddCustomerBodyModel({
    this.id,
    this.enFullName,
    this.arFullName,
    this.address,
    this.email,
    this.commercialRegister,
    this.phoneNumber,
    this.cityId,
    this.storeId,
    this.taxIdNumber,
    this.isDelivery,
    this.commission,
    this.customerCategoryId,
    this.isActive,
  });

  AddCustomerBodyModel copyWith({
    String? id,
    String? enFullName,
    String? arFullName,
    String? address,
    String? email,
    String? commercialRegister,
    String? phoneNumber,
    String? cityId,
    String? storeId,
    String? taxIdNumber,
    bool? isDelivery,
    int? commission,
    String? customerCategoryId,
    bool? isActive,
  }) =>
      AddCustomerBodyModel(
        id: id ?? this.id,
        enFullName: enFullName ?? this.enFullName,
        arFullName: arFullName ?? this.arFullName,
        address: address ?? this.address,
        email: email ?? this.email,
        commercialRegister: commercialRegister ?? this.commercialRegister,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        cityId: cityId ?? this.cityId,
        storeId: storeId ?? this.storeId,
        taxIdNumber: taxIdNumber ?? this.taxIdNumber,
        isDelivery: isDelivery ?? this.isDelivery,
        commission: commission ?? this.commission,
        customerCategoryId: customerCategoryId ?? this.customerCategoryId,
        isActive: isActive ?? this.isActive,
      );

  factory AddCustomerBodyModel.fromJson(Map<String, dynamic> json) => AddCustomerBodyModel(
    id: json["id"],
    enFullName: json["enFullName"],
    arFullName: json["arFullName"],
    address: json["address"],
    email: json["email"],
    commercialRegister: json["commercialRegister"],
    phoneNumber: json["phoneNumber"],
    cityId: json["cityId"],
    storeId: json["storeId"],
    taxIdNumber: json["taxIdNumber"],
    isDelivery: json["isDelivery"],
    commission: json["commission"],
    customerCategoryId: json["customerCategoryId"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "enFullName": enFullName,
    "arFullName": arFullName,
    "address": address,
    "email": email,
    "commercialRegister": commercialRegister,
    "phoneNumber": phoneNumber,
    "cityId": cityId,
    "storeId": storeId,
    "taxIdNumber": taxIdNumber,
    "isDelivery": isDelivery,
    "commission": commission,
    "customerCategoryId": customerCategoryId,
    "isActive": isActive,
  };
}
