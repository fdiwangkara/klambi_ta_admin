// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool status;
  String message;
  List<Datum> data;

  ProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  int price;
  String descripsi;
  double rate;
  String category;
  String imagee;
  int stock;
  int sold;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.title,
    required this.price,
    required this.descripsi,
    required this.rate,
    required this.category,
    required this.imagee,
    required this.stock,
    required this.sold,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    descripsi: json["descripsi"],
    rate: json["rate"]?.toDouble(),
    category: json["category"],
    imagee: json["imagee"],
    stock: json["stock"],
    sold: json["sold"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "descripsi": descripsi,
    "rate": rate,
    "category": category,
    "imagee": imagee,
    "stock": stock,
    "sold": sold,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
