// To parse this JSON data, do
//
//     final loginAdmin = loginAdminFromJson(jsonString);

import 'dart:convert';

LoginAdmin loginAdminFromJson(String str) => LoginAdmin.fromJson(json.decode(str));

String loginAdminToJson(LoginAdmin data) => json.encode(data.toJson());

class LoginAdmin {
  bool success;
  String message;
  Data data;

  LoginAdmin({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginAdmin.fromJson(Map<String, dynamic> json) => LoginAdmin(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String username;
  String token;

  Data({
    required this.username,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "token": token,
  };
}
