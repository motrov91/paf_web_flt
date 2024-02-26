import 'dart:convert';

class ProductByIdResponse {
  ProductByIdResponse({
    required this.id,
    required this.img,
    required this.name,
    required this.reference,
    required this.state,
    required this.urlVideo,
    required this.userId,
    required this.markets,
    required this.descriptions,
    required this.observationsMarket,
    required this.features,
    required this.observationsFeatures,
    required this.adventages,
    required this.observationsAdventages,
  });

  final int id;
  final dynamic img;
  final String name;
  final String reference;
  final bool state;
  final String urlVideo;
  final int userId;
  final List<String> markets;
  final List<String> descriptions;
  final List<dynamic> observationsMarket;
  final List<String> features;
  final List<dynamic> observationsFeatures;
  final List<String> adventages;
  final List<dynamic> observationsAdventages;

  factory ProductByIdResponse.fromJson(String str) =>
      ProductByIdResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductByIdResponse.fromMap(Map<String, dynamic> json) =>
      ProductByIdResponse(
        id: json["id"],
        img: json["img"],
        name: json["name"],
        reference: json["reference"],
        state: json["state"],
        urlVideo: json["url_video"],
        userId: json["userId"],
        markets: List<String>.from(json["markets"].map((x) => x)),
        descriptions: List<String>.from(json["descriptions"].map((x) => x)),
        observationsMarket:
            List<dynamic>.from(json["observationsMarket"].map((x) => x)),
        features: List<String>.from(json["features"].map((x) => x)),
        observationsFeatures:
            List<dynamic>.from(json["observationsFeatures"].map((x) => x)),
        adventages: List<String>.from(json["adventages"].map((x) => x)),
        observationsAdventages:
            List<dynamic>.from(json["observationsAdventages"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "img": img,
        "name": name,
        "reference": reference,
        "state": state,
        "url_video": urlVideo,
        "userId": userId,
        "markets": List<dynamic>.from(markets.map((x) => x)),
        "descriptions": List<dynamic>.from(descriptions.map((x) => x)),
        "observationsMarket":
            List<dynamic>.from(observationsMarket.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "observationsFeatures":
            List<dynamic>.from(observationsFeatures.map((x) => x)),
        "adventages": List<dynamic>.from(adventages.map((x) => x)),
        "observationsAdventages":
            List<dynamic>.from(observationsAdventages.map((x) => x)),
      };

  @override
  String toString() {
    return "id: $id - img: $img - name: $name - markets: $markets - observationsMarket: $descriptions";
  }
}
