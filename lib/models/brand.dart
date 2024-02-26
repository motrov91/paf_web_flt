

import 'dart:convert';

import 'user.dart';

class Brand {
  Brand({
    required this.id,
    required this.brand,
    this.imageBrand,
    required this.userId,
    required this.user,
    required this.publish
  });

  int id;
  String brand;
  String? imageBrand;
  int userId;
  bool publish;
  User user;

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brand: json["brand"],
        imageBrand: json["imageBrand"],
        userId: json["userId"],
        publish: json["publish"],
        user: User.fromMap(json["User"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "imageBrand": imageBrand,
        "userId": userId,
        "publish": publish,
        "User": user.toMap(),
      };
}