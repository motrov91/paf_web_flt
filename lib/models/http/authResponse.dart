// To parse this JSON data, do
//
//     final authesponse = authesponseFromMap(jsonString);
import 'dart:convert';

import 'package:paf_web/models/user.dart';

class AuthResponse {
    AuthResponse({
        required this.userData,
        required this.token,
        required this.code,
    });

    User userData;
    String token;
    int code;

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        userData: User.fromMap(json["userData"]),
        token: json["token"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "userData": userData.toMap(),
        "token": token,
        "code": code,
    };
}

