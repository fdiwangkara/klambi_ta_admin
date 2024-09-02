// To parse this JSON data, do
//
//     final showProfile = showProfileFromJson(jsonString);

import 'dart:convert';

ShowProfile showProfileFromJson(String str) => ShowProfile.fromJson(json.decode(str));

String showProfileToJson(ShowProfile data) => json.encode(data.toJson());

class ShowProfile {
  bool success;
  String message;
  UserProfile data;

  ShowProfile({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowProfile.fromJson(Map<String, dynamic> json) => ShowProfile(
    success: json["success"],
    message: json["message"],
    data: UserProfile.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class UserProfile {
  String username;
  dynamic image;

  UserProfile({
    required this.username,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    username: json["username"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "image": image,
  };
}