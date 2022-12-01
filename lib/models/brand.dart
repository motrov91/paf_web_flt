import 'dart:convert';

import 'package:paf_web/models/user.dart';

class Brand {
    Brand({
        required this.id,
        required this.brand,
        required this.userId,
        required this.user,
    });

    int id;
    String brand;
    int userId;
    User user;

    factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brand: json["brand"],
        userId: json["userId"],
        user: User.fromMap(json["User"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "userId": userId,
        "User": user.toMap(),
    };
}
