// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.responseCode,
    this.responseMessage,
    this.dateSet,
  });

  int responseCode;
  String responseMessage;
  DateSet dateSet;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    responseCode: json["responseCode"] == null ? null : json["responseCode"],
    responseMessage: json["responseMessage"] == null ? null : json["responseMessage"],
    dateSet: json["dateSet"] == null ? null : DateSet.fromJson(json["dateSet"]),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode == null ? null : responseCode,
    "responseMessage": responseMessage == null ? null : responseMessage,
    "dateSet": dateSet == null ? null : dateSet.toJson(),
  };
}

class DateSet {
  DateSet({
    this.fullName,
    this.email,
    this.userName,
    this.dateCreated,
    this.token,
    this.roles,
  });

  String fullName;
  String email;
  String userName;
  DateTime dateCreated;
  String token;
  List<String> roles;

  factory DateSet.fromJson(Map<String, dynamic> json) => DateSet(
    fullName: json["fullName"] == null ? null : json["fullName"],
    email: json["email"] == null ? null : json["email"],
    userName: json["userName"] == null ? null : json["userName"],
    dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
    token: json["token"] == null ? null : json["token"],
    roles: json["roles"] == null ? null : List<String>.from(json["roles"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "userName": userName == null ? null : userName,
    "dateCreated": dateCreated == null ? null : dateCreated.toIso8601String(),
    "token": token == null ? null : token,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
  };
}
