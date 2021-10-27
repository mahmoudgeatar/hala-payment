// To parse this JSON data, do
//
//     final roleModel = roleModelFromJson(jsonString);

import 'dart:convert';

RoleModel roleModelFromJson(String str) => RoleModel.fromJson(json.decode(str));

String roleModelToJson(RoleModel data) => json.encode(data.toJson());

class RoleModel {
  RoleModel({
    this.responseCode,
    this.responseMessage,
    this.dateSet,
  });

  int responseCode;
  String responseMessage;
  List<String> dateSet;

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    responseCode: json["responseCode"] == null ? null : json["responseCode"],
    responseMessage: json["responseMessage"] == null ? null : json["responseMessage"],
    dateSet: json["dateSet"] == null ? null : List<String>.from(json["dateSet"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode == null ? null : responseCode,
    "responseMessage": responseMessage == null ? null : responseMessage,
    "dateSet": dateSet == null ? null : List<dynamic>.from(dateSet.map((x) => x)),
  };
}
