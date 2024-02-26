import 'dart:convert';

import 'package:paf_web/models/user.dart';

class Product {
    Product({
    required this.id,
    required this.img,
    required this.name,
    required this.reference,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.urlVideo,
    this.videoExtra1,
    this.etiquetaEnlace1,
    this.etiquetaEnlace2,
    this.etiquetaEnlace3,
    this.urlExtra1,
    this.urlExtra2,
    this.urlExtra3,
    required this.markets,
    required this.descriptionsMarkets,
    required this.observationsMarkets,
    required this.features,
    required this.observationsFeature,
    required this.advantages,
    required this.observationsAdvantage,
    required this.userId,
    required this.user,
    });

  final int id;
  String? img;
  String name;
  String reference;
  bool state;
  DateTime createdAt;
  DateTime updatedAt;
  String urlVideo;
  String? videoExtra1;
  String? etiquetaEnlace1;
  String? etiquetaEnlace2;
  String? etiquetaEnlace3;
  String? urlExtra1;
  String? urlExtra2;
  String? urlExtra3;
  List<String> markets;
  List<String> descriptionsMarkets;
  List<dynamic> observationsMarkets;
  List<dynamic> features;
  List<dynamic> observationsFeature;
  List<dynamic> advantages;
  List<dynamic> observationsAdvantage;
  final int userId;
  final User user;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        img: json["img"] ?? '',
        name: json["name"],
        reference: json["reference"],
        state: json["state"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        urlVideo: json["url_video"],
        videoExtra1: json["videoExtra1"],
        etiquetaEnlace1: json["etiquetaEnlace1"],
        etiquetaEnlace2: json["etiquetaEnlace2"],
        etiquetaEnlace3: json["etiquetaEnlace3"],
        urlExtra1: json["urlExtra1"],
        urlExtra2: json["urlExtra2"],
        urlExtra3: json["urlExtra3"],
        markets: List<String>.from(json["markets"].map((x) => x)),
        descriptionsMarkets:
            List<String>.from(json["descriptionsMarkets"].map((x) => x)),
        observationsMarkets:
            List<dynamic>.from(json["observationsMarkets"].map((x) => x)),
        features: List<dynamic>.from(json["features"].map((x) => x)),
        observationsFeature:
            List<dynamic>.from(json["observationsFeature"].map((x) => x)),
        advantages: List<dynamic>.from(json["advantages"].map((x) => x)),
        observationsAdvantage:
            List<dynamic>.from(json["observationsAdvantage"].map((x) => x)),
        userId: json["userId"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "img": img,
        "name": name,
        "reference": reference,
        "state": state,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "url_video": urlVideo,
        "videoExtra1": videoExtra1,
        "etiquetaEnlace1": etiquetaEnlace1,
        "etiquetaEnlace2": etiquetaEnlace2,
        "etiquetaEnlace3": etiquetaEnlace3,
        "urlExtra1": urlExtra1,
        "urlExtra2": urlExtra2,
        "urlExtra3": urlExtra3,
        "markets": List<dynamic>.from(markets.map((x) => x)),
        "descriptionsMarkets":
            List<dynamic>.from(descriptionsMarkets.map((x) => x)),
        "observationsMarkets":
            List<dynamic>.from(observationsMarkets.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "observationsFeature":
            List<dynamic>.from(observationsFeature.map((x) => x)),
        "advantages": List<dynamic>.from(advantages.map((x) => x)),
        "observationsAdvantage":
            List<dynamic>.from(observationsAdvantage.map((x) => x)),
        "userId": userId,
        "user": user.toMap(),
    };
}