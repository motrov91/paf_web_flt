// To parse this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);
import 'dart:convert';

import 'package:paf_web/models/product.dart';

class ProductResponse {
    ProductResponse({
        required this.products,
    });

    List<Product> products;

    factory ProductResponse.fromJson(String str) => ProductResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
    };
}


