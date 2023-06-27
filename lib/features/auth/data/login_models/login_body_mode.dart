import 'dart:convert';

LoginBodyModel loginBodyModelFromJson(String str) =>
    LoginBodyModel.fromJson(json.decode(str));

String loginBodyModelToJson(LoginBodyModel data) => json.encode(data.toJson());

class LoginBodyModel {
  String? userName;
  String? password;
  String? terminlKey;

  LoginBodyModel({
    this.userName,
    this.password,
    this.terminlKey,
  });

  LoginBodyModel copyWith({
    String? userName,
    String? password,
    String? terminlKey,
  }) =>
      LoginBodyModel(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        terminlKey: terminlKey ?? this.terminlKey,
      );

  factory LoginBodyModel.fromJson(Map<String, dynamic> json) => LoginBodyModel(
        userName: json["userName"],
        password: json["password"],
        terminlKey: json["terminlKey"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "terminlKey": terminlKey,
      };
}
