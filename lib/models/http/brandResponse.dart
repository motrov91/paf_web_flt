// To parse this JSON data, do
//
//     final brandResponse = brandResponseFromMap(jsonString);
import 'dart:convert';
import '../brand.dart';


class BrandResponse {
    BrandResponse({
        required this.brands,
    });

    List<Brand> brands;

    factory BrandResponse.fromJson(String str) => BrandResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BrandResponse.fromMap(Map<String, dynamic> json) => BrandResponse(
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "brands": List<dynamic>.from(brands.map((x) => x.toMap())),
    };
}