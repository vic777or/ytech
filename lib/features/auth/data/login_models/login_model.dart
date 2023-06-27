import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  LoginModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  LoginModel copyWith({
    Result? result,
    dynamic targetUrl,
    bool? success,
    dynamic error,
    bool? unAuthorizedRequest,
    bool? abp,
  }) =>
      LoginModel(
        result: result ?? this.result,
        targetUrl: targetUrl ?? this.targetUrl,
        success: success ?? this.success,
        error: error ?? this.error,
        unAuthorizedRequest: unAuthorizedRequest ?? this.unAuthorizedRequest,
        abp: abp ?? this.abp,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  Data? data;
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
    Data? data,
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
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        result: json["result"],
        message: json["message"],
        totalRecords: json["totalRecords"],
        imgsUrl: json["imgsUrl"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "result": result,
        "message": message,
        "totalRecords": totalRecords,
        "imgsUrl": imgsUrl,
      };
}

class Data {
  int? loginResultEnum;
  dynamic message;
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  int? userId;
  List<String>? grantedPermissions;
  bool? isTenant;
  List<PurchasedFeature>? purchasedFeatures;
  int? maxImageSize;
  int? maxFileSize;
  int? userType;
  bool? haveOpeningShift;
  String? cityId;
  String? storeId;
  int? numberOfDigitDecimal;
  dynamic customColumns;
  String? arStoreName;
  String? enStoreName;
  dynamic projectInfo;
  dynamic userInfo;

  Data({
    this.loginResultEnum,
    this.message,
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
    this.grantedPermissions,
    this.isTenant,
    this.purchasedFeatures,
    this.maxImageSize,
    this.maxFileSize,
    this.userType,
    this.haveOpeningShift,
    this.cityId,
    this.storeId,
    this.numberOfDigitDecimal,
    this.customColumns,
    this.arStoreName,
    this.enStoreName,
    this.projectInfo,
    this.userInfo,
  });

  Data copyWith({
    int? loginResultEnum,
    dynamic message,
    String? accessToken,
    String? encryptedAccessToken,
    int? expireInSeconds,
    int? userId,
    List<String>? grantedPermissions,
    bool? isTenant,
    List<PurchasedFeature>? purchasedFeatures,
    int? maxImageSize,
    int? maxFileSize,
    int? userType,
    bool? haveOpeningShift,
    String? cityId,
    String? storeId,
    int? numberOfDigitDecimal,
    dynamic customColumns,
    String? arStoreName,
    String? enStoreName,
    dynamic projectInfo,
    dynamic userInfo,
  }) =>
      Data(
        loginResultEnum: loginResultEnum ?? this.loginResultEnum,
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        encryptedAccessToken: encryptedAccessToken ?? this.encryptedAccessToken,
        expireInSeconds: expireInSeconds ?? this.expireInSeconds,
        userId: userId ?? this.userId,
        grantedPermissions: grantedPermissions ?? this.grantedPermissions,
        isTenant: isTenant ?? this.isTenant,
        purchasedFeatures: purchasedFeatures ?? this.purchasedFeatures,
        maxImageSize: maxImageSize ?? this.maxImageSize,
        maxFileSize: maxFileSize ?? this.maxFileSize,
        userType: userType ?? this.userType,
        haveOpeningShift: haveOpeningShift ?? this.haveOpeningShift,
        cityId: cityId ?? this.cityId,
        storeId: storeId ?? this.storeId,
        numberOfDigitDecimal: numberOfDigitDecimal ?? this.numberOfDigitDecimal,
        customColumns: customColumns ?? this.customColumns,
        arStoreName: arStoreName ?? this.arStoreName,
        enStoreName: enStoreName ?? this.enStoreName,
        projectInfo: projectInfo ?? this.projectInfo,
        userInfo: userInfo ?? this.userInfo,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        loginResultEnum: json["loginResultEnum"],
        message: json["message"],
        accessToken: json["accessToken"],
        encryptedAccessToken: json["encryptedAccessToken"],
        expireInSeconds: json["expireInSeconds"],
        userId: json["userId"],
        grantedPermissions: json["grantedPermissions"] == null
            ? []
            : List<String>.from(json["grantedPermissions"]!.map((x) => x)),
        isTenant: json["isTenant"],
        purchasedFeatures: json["purchasedFeatures"] == null
            ? []
            : List<PurchasedFeature>.from(json["purchasedFeatures"]!
                .map((x) => PurchasedFeature.fromJson(x))),
        maxImageSize: json["maxImageSize"],
        maxFileSize: json["maxFileSize"],
        userType: json["userType"],
        haveOpeningShift: json["haveOpeningShift"],
        cityId: json["cityId"],
        storeId: json["storeId"],
        numberOfDigitDecimal: json["numberOfDigitDecimal"],
        customColumns: json["customColumns"],
        arStoreName: json["arStoreName"],
        enStoreName: json["enStoreName"],
        projectInfo: json["projectInfo"],
        userInfo: json["userInfo"],
      );

  Map<String, dynamic> toJson() => {
        "loginResultEnum": loginResultEnum,
        "message": message,
        "accessToken": accessToken,
        "encryptedAccessToken": encryptedAccessToken,
        "expireInSeconds": expireInSeconds,
        "userId": userId,
        "grantedPermissions": grantedPermissions == null
            ? []
            : List<dynamic>.from(grantedPermissions!.map((x) => x)),
        "isTenant": isTenant,
        "purchasedFeatures": purchasedFeatures == null
            ? []
            : List<dynamic>.from(purchasedFeatures!.map((x) => x.toJson())),
        "maxImageSize": maxImageSize,
        "maxFileSize": maxFileSize,
        "userType": userType,
        "haveOpeningShift": haveOpeningShift,
        "cityId": cityId,
        "storeId": storeId,
        "numberOfDigitDecimal": numberOfDigitDecimal,
        "customColumns": customColumns,
        "arStoreName": arStoreName,
        "enStoreName": enStoreName,
        "projectInfo": projectInfo,
        "userInfo": userInfo,
      };
}

class PurchasedFeature {
  int? featureKind;
  bool? isExist;
  bool? isUnLimted;
  int? avilableQuantity;
  bool? canCreateMore;
  int? createdQuantity;

  PurchasedFeature({
    this.featureKind,
    this.isExist,
    this.isUnLimted,
    this.avilableQuantity,
    this.canCreateMore,
    this.createdQuantity,
  });

  PurchasedFeature copyWith({
    int? featureKind,
    bool? isExist,
    bool? isUnLimted,
    int? avilableQuantity,
    bool? canCreateMore,
    int? createdQuantity,
  }) =>
      PurchasedFeature(
        featureKind: featureKind ?? this.featureKind,
        isExist: isExist ?? this.isExist,
        isUnLimted: isUnLimted ?? this.isUnLimted,
        avilableQuantity: avilableQuantity ?? this.avilableQuantity,
        canCreateMore: canCreateMore ?? this.canCreateMore,
        createdQuantity: createdQuantity ?? this.createdQuantity,
      );

  factory PurchasedFeature.fromJson(Map<String, dynamic> json) =>
      PurchasedFeature(
        featureKind: json["featureKind"],
        isExist: json["isExist"],
        isUnLimted: json["isUnLimted"],
        avilableQuantity: json["avilableQuantity"],
        canCreateMore: json["canCreateMore"],
        createdQuantity: json["createdQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "featureKind": featureKind,
        "isExist": isExist,
        "isUnLimted": isUnLimted,
        "avilableQuantity": avilableQuantity,
        "canCreateMore": canCreateMore,
        "createdQuantity": createdQuantity,
      };
}
