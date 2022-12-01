import 'dart:convert';

import 'package:paf_web/models/user.dart';

class Product {
    Product({
      required this.id,
      required this.name,
      required this.reference,
      required this.state,
      this.market1,
      this.descriptionMarket1,
      this.observations1,
      this.market2,
      this.descriptionMarket2,
      this.observations2,
      this.market3,
      this.descriptionMarket3,
      this.observations3,
      this.market4,
      this.descriptionMarket4,
      this.observations4,
      this.market5,
      this.descriptionMarket5,
      this.observations5,
      this.market6,
      this.descriptionMarket6,
      this.observations6,
      this.market7,
      this.descriptionMarket7,
      this.observations7,
      this.market8,
      this.descriptionMarket8,
      this.observations8,
      this.market9,
      this.descriptionMarket9,
      this.observations9,
      this.market10,
      this.descriptionMarket10,
      this.observations10,
      this.market11,
      this.descriptionMarket11,
      this.observations11,
      this.market12,
      this.descriptionMarket12,
      this.observations12,
      this.feature1,
      this.observationsFeature1,
      this.feature2,
      this.observationsFeature2,
      this.feature3,
      this.observationsFeature3,
      this.feature4,
      this.observationsFeature4,
      this.feature5,
      this.observationsFeature5,
      this.urlVideo,
      this.adventage1,
      this.observationsAdventage1,
      this.adventage2,
      this.observationsAdventage2,
      this.adventage3,
      this.observationsAdventage3,
      this.adventage4,
      this.observationsAdventage4,
      this.adventage5,
      this.observationsAdventage5,
      this.createdAt,
      this.updatedAt,
      required this.userId,
      required this.user,
    });

    int id;
    String name;
    String reference;
    bool state;
    String? market1;
    String? descriptionMarket1;
    String? observations1;
    String? market2;
    String? descriptionMarket2;
    String? observations2;
    String? market3;
    String? descriptionMarket3;
    String? observations3;
    String? market4;
    String? descriptionMarket4;
    String? observations4;
    String? market5;
    String? descriptionMarket5;
    String? observations5;
    String? market6;
    String? descriptionMarket6;
    String? observations6;
    String? market7;
    String? descriptionMarket7;
    String? observations7;
    String? market8;
    String? descriptionMarket8;
    String? observations8;
    String? market9;
    String? descriptionMarket9;
    String? observations9;
    String? market10;
    String? descriptionMarket10;
    String? observations10;
    String? market11;
    String? descriptionMarket11;
    String? observations11;
    String? market12;
    String? descriptionMarket12;
    String? observations12;
    String? feature1;
    String? observationsFeature1;
    String? feature2;
    String? observationsFeature2;
    String? feature3;
    String? observationsFeature3;
    String? feature4;
    String? observationsFeature4;
    String? feature5;
    String? observationsFeature5;
    String? urlVideo;
    String? adventage1;
    String? observationsAdventage1;
    dynamic adventage2;
    String? observationsAdventage2;
    dynamic adventage3;
    String? observationsAdventage3;
    dynamic adventage4;
    String? observationsAdventage4;
    dynamic adventage5;
    String? observationsAdventage5;
    DateTime? createdAt;
    DateTime? updatedAt;
    int userId;
    User user;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        reference: json["reference"],
        state: json["state"],
        market1: json["market1"],
        descriptionMarket1: json["description_market1"],
        observations1: json["observations1"] == null ? null : json["observations1"],
        market2: json["market2"] == null ? null : json["market2"],
        descriptionMarket2: json["description_market2"] == null ? null : json["description_market2"],
        observations2: json["observations2"] == null ? null : json["observations2"],
        market3: json["market3"] == null ? null : json["market3"],
        descriptionMarket3: json["description_market3"] == null ? null : json["description_market3"],
        observations3: json["observations3"] == null ? null : json["observations3"],
        market4: json["market4"] == null ? null : json["market4"],
        descriptionMarket4: json["description_market4"] == null ? null : json["description_market4"],
        observations4: json["observations4"] == null ? null : json["observations4"],
        market5: json["market5"] == null ? null : json["market5"],
        descriptionMarket5: json["description_market5"] == null ? null : json["description_market5"],
        observations5: json["observations5"] == null ? null : json["observations5"],
        market6: json["market6"] == null ? null : json["market6"],
        descriptionMarket6: json["description_market6"] == null ? null : json["description_market6"],
        observations6: json["observations6"] == null ? null : json["observations6"],
        market7: json["market7"] == null ? null : json["market7"],
        descriptionMarket7: json["description_market7"] == null ? null : json["description_market7"],
        observations7: json["observations7"] == null ? null : json["observations7"],
        market8: json["market8"] == null ? null : json["market8"],
        descriptionMarket8: json["description_market8"] == null ? null : json["description_market8"],
        observations8: json["observations8"] == null ? null : json["observations8"],
        market9: json["market9"] == null ? null : json["market9"],
        descriptionMarket9: json["description_market9"] == null ? null : json["description_market9"],
        observations9: json["observations9"] == null ? null : json["observations9"],
        market10: json["market10"] == null ? null : json["market10"],
        descriptionMarket10: json["description_market10"] == null ? null : json["description_market10"],
        observations10: json["observations10"] == null ? null : json["observations10"],
        market11: json["market11"] == null ? null : json["market11"],
        descriptionMarket11: json["description_market11"] == null ? null : json["description_market11"],
        observations11: json["observations11"] == null ? null : json["observations11"],
        market12: json["market12"] == null ? null : json["market12"],
        descriptionMarket12: json["description_market12"] == null ? null : json["description_market12"],
        observations12: json["observations12"] == null ? null : json["observations12"],
        feature1: json["feature1"],
        observationsFeature1: json["observationsFeature1"] == null ? null : json["observationsFeature1"],
        feature2: json["feature2"] == null ? null : json["feature2"],
        observationsFeature2: json["observationsFeature2"] == null ? null : json["observationsFeature2"],
        feature3: json["feature3"] == null ? null : json["feature3"],
        observationsFeature3: json["observationsFeature3"] == null ? null : json["observationsFeature3"],
        feature4: json["feature4"] == null ? null : json["feature4"],
        observationsFeature4: json["observationsFeature4"] == null ? null : json["observationsFeature4"],
        feature5: json["feature5"] == null ? null : json["feature5"],
        observationsFeature5: json["observationsFeature5"] == null ? null : json["observationsFeature5"],
        urlVideo: json["url_video"],
        adventage1: json["adventage1"] == null ? null : json["adventage1"],
        observationsAdventage1: json["observationsAdventage1"] == null ? null : json["observationsAdventage1"],
        adventage2: json["adventage2"],
        observationsAdventage2: json["observationsAdventage2"] == null ? null : json["observationsAdventage2"],
        adventage3: json["adventage3"],
        observationsAdventage3: json["observationsAdventage3"] == null ? null : json["observationsAdventage3"],
        adventage4: json["adventage4"],
        observationsAdventage4: json["observationsAdventage4"] == null ? null : json["observationsAdventage4"],
        adventage5: json["adventage5"],
        observationsAdventage5: json["observationsAdventage5"] == null ? null : json["observationsAdventage5"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        user: User.fromMap(json["User"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "reference": reference,
        "state": state,
        "market1": market1,
        "description_market1": descriptionMarket1,
        "observations1": observations1 == null ? null : observations1,
        "market2": market2 == null ? null : market2,
        "description_market2": descriptionMarket2 == null ? null : descriptionMarket2,
        "observations2": observations2 == null ? null : observations2,
        "market3": market3 == null ? null : market3,
        "description_market3": descriptionMarket3 == null ? null : descriptionMarket3,
        "observations3": observations3 == null ? null : observations3,
        "market4": market4 == null ? null : market4,
        "description_market4": descriptionMarket4 == null ? null : descriptionMarket4,
        "observations4": observations4 == null ? null : observations4,
        "market5": market5 == null ? null : market5,
        "description_market5": descriptionMarket5 == null ? null : descriptionMarket5,
        "observations5": observations5 == null ? null : observations5,
        "market6": market6 == null ? null : market6,
        "description_market6": descriptionMarket6 == null ? null : descriptionMarket6,
        "observations6": observations6 == null ? null : observations6,
        "market7": market7 == null ? null : market7,
        "description_market7": descriptionMarket7 == null ? null : descriptionMarket7,
        "observations7": observations7 == null ? null : observations7,
        "market8": market8 == null ? null : market8,
        "description_market8": descriptionMarket8 == null ? null : descriptionMarket8,
        "observations8": observations8 == null ? null : observations8,
        "market9": market9 == null ? null : market9,
        "description_market9": descriptionMarket9 == null ? null : descriptionMarket9,
        "observations9": observations9 == null ? null : observations9,
        "market10": market10 == null ? null : market10,
        "description_market10": descriptionMarket10 == null ? null : descriptionMarket10,
        "observations10": observations10 == null ? null : observations10,
        "market11": market11 == null ? null : market11,
        "description_market11": descriptionMarket11 == null ? null : descriptionMarket11,
        "observations11": observations11 == null ? null : observations11,
        "market12": market12 == null ? null : market12,
        "description_market12": descriptionMarket12 == null ? null : descriptionMarket12,
        "observations12": observations12 == null ? null : observations12,
        "feature1": feature1,
        "observationsFeature1": observationsFeature1 == null ? null : observationsFeature1,
        "feature2": feature2 == null ? null : feature2,
        "observationsFeature2": observationsFeature2 == null ? null : observationsFeature2,
        "feature3": feature3 == null ? null : feature3,
        "observationsFeature3": observationsFeature3 == null ? null : observationsFeature3,
        "feature4": feature4 == null ? null : feature4,
        "observationsFeature4": observationsFeature4 == null ? null : observationsFeature4,
        "feature5": feature5 == null ? null : feature5,
        "observationsFeature5": observationsFeature5 == null ? null : observationsFeature5,
        "url_video": urlVideo,
        "adventage1": adventage1 == null ? null : adventage1,
        "observationsAdventage1": observationsAdventage1 == null ? null : observationsAdventage1,
        "adventage2": adventage2,
        "observationsAdventage2": observationsAdventage2 == null ? null : observationsAdventage2,
        "adventage3": adventage3,
        "observationsAdventage3": observationsAdventage3 == null ? null : observationsAdventage3,
        "adventage4": adventage4,
        "observationsAdventage4": observationsAdventage4 == null ? null : observationsAdventage4,
        "adventage5": adventage5,
        "observationsAdventage5": observationsAdventage5 == null ? null : observationsAdventage5,
        "createdAt": createdAt.toString(),
        "updatedAt": updatedAt.toString(),
        "userId": userId,
        "User": user.toMap(),
    };
}