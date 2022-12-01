// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromMap(jsonString);

import 'dart:convert';
import 'package:paf_web/models/category.dart';

class CategoryResponse {
    CategoryResponse({
        required this.categories,
    });

    List<Category> categories;

    factory CategoryResponse.fromJson(String str) => CategoryResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryResponse.fromMap(Map<String, dynamic> json) => CategoryResponse(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
    };
}





