// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  bool status;
  String message;
  List<String> data;

  StatusModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    status: json["status"],
    message: json["message"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
