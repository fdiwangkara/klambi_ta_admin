// To parse this JSON data, do
//
//     final editModel = editModelFromJson(jsonString);

import 'dart:convert';

EditModel editModelFromJson(String str) => EditModel.fromJson(json.decode(str));

String editModelToJson(EditModel data) => json.encode(data.toJson());

class EditModel {
  bool success;
  String message;
  Data data;

  EditModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EditModel.fromJson(Map<String, dynamic> json) => EditModel(
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
  dynamic image;

  Data({
    required this.username,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "image": image,
  };
}
