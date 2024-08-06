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
  Admin admin;
  String token;

  Data({
    required this.admin,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    admin: Admin.fromJson(json["admin"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "admin": admin.toJson(),
    "token": token,
  };
}

class Admin {
  String name;
  String email;

  Admin({
    required this.name,
    required this.email,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
