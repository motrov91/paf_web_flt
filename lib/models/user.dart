import 'dart:convert';

class User {
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.cargo,
      required this.rolId});

  int id;
  String name;
  String email;
  String cargo;
  int rolId;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        cargo: json["cargo"],
        rolId: json["rolId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "cargo": cargo,
        "rolId": rolId,
      };
}
