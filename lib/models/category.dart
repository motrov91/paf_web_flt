import 'dart:convert';

class Category {
    Category({
        required this.id,
        required this.name,
        required this.brandId,
        required this.brand,
    });

    int id;
    String name;
    int brandId;
    _Brand brand;

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        brandId: json["brandId"],
        brand: _Brand.fromMap(json["Brand"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "brandId": brandId,
        "Brand": brand.toMap(),
    };
}

class _Brand {
    _Brand({
        required this.id,
        required this.brand,
        required this.userId,
    });

    int id;
    String brand;
    int userId;

    factory _Brand.fromJson(String str) => _Brand.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory _Brand.fromMap(Map<String, dynamic> json) => _Brand(
        id: json["id"],
        brand: json["brand"],
        userId: json["userId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "userId": userId,
    };
}