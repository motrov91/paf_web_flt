
import 'dart:convert';

import 'package:paf_web/models/user.dart';

class UserResponse {
    UserResponse({
        required this.users,
    });

    List<User> users;

    factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
    };
}



